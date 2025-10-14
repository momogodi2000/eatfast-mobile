/// Menu Management Screen
/// Allows restaurant owners to manage menu categories and items
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../../../../core/theme/design_tokens.dart';
import '../../../../shared/widgets/loading/app_loading_indicator.dart';
import '../../domain/models/menu_management.dart';
import '../../providers/restaurant_owner_provider.dart';
import '../widgets/restaurant_manager_drawer.dart';

class MenuManagementScreen extends ConsumerStatefulWidget {
  final String restaurantId;

  const MenuManagementScreen({
    super.key,
    required this.restaurantId,
  });

  @override
  ConsumerState<MenuManagementScreen> createState() => _MenuManagementScreenState();
}

class _MenuManagementScreenState extends ConsumerState<MenuManagementScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final menuCategoriesAsync = ref.watch(menuCategoriesProvider(widget.restaurantId));

    return Scaffold(
      backgroundColor: DesignTokens.backgroundGrey,
      drawer: RestaurantManagerDrawer(restaurantId: widget.restaurantId),
      appBar: AppBar(
        title: const Text('Gestion du Menu'),
        backgroundColor: DesignTokens.primaryColor,
        foregroundColor: DesignTokens.white,
        actions: [
          IconButton(
            onPressed: () => _showSearchDialog(),
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () => _showBulkActionsDialog(),
            icon: const Icon(Icons.more_vert),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: DesignTokens.white,
          labelColor: DesignTokens.white,
          unselectedLabelColor: DesignTokens.white.withValues(alpha: 0.7),
          tabs: const [
            Tab(
              icon: Icon(Icons.category),
              text: 'Catégories',
            ),
            Tab(
              icon: Icon(Icons.restaurant_menu),
              text: 'Articles',
            ),
          ],
        ),
      ),
      body: menuCategoriesAsync.when(
        data: (categories) => TabBarView(
          controller: _tabController,
          children: [
            _buildCategoriesView(categories),
            _buildItemsView(categories),
          ],
        ),
        loading: () => const Center(child: AppLoadingIndicator()),
        error: (error, _) => _buildErrorView(error),
      ),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'menu_management_fab',
        onPressed: () => _showAddDialog(),
        icon: const Icon(Icons.add),
        label: Text(_tabController.index == 0 ? 'Nouvelle Catégorie' : 'Nouvel Article'),
        backgroundColor: DesignTokens.primaryColor,
      ),
    );
  }

  Widget _buildCategoriesView(List<MenuCategory> categories) {
    if (categories.isEmpty) {
      return _buildEmptyState(
        icon: Icons.category_outlined,
        title: 'Aucune catégorie',
        subtitle: 'Commencez par créer des catégories pour votre menu',
        actionLabel: 'Créer une catégorie',
        onAction: () => _showAddCategoryDialog(),
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(menuCategoriesProvider(widget.restaurantId));
      },
      child: ListView.builder(
        padding: const EdgeInsets.all(DesignTokens.spaceMD),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return _buildCategoryCard(category);
        },
      ),
    );
  }

  Widget _buildItemsView(List<MenuCategory> categories) {
    final allItems = categories.expand((cat) => cat.items).toList();

    if (allItems.isEmpty) {
      return _buildEmptyState(
        icon: Icons.restaurant_menu_outlined,
        title: 'Aucun article',
        subtitle: 'Ajoutez des articles à vos catégories de menu',
        actionLabel: 'Ajouter un article',
        onAction: () => _showAddItemDialog(categories.isNotEmpty ? categories[0] : null),
      );
    }

    final filteredItems = _searchQuery.isEmpty
        ? allItems
        : allItems.where((item) =>
            item.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
            item.description.toLowerCase().contains(_searchQuery.toLowerCase())).toList();

    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(menuCategoriesProvider(widget.restaurantId));
      },
      child: ListView.builder(
        padding: const EdgeInsets.all(DesignTokens.spaceMD),
        itemCount: filteredItems.length,
        itemBuilder: (context, index) {
          final item = filteredItems[index];
          return _buildItemCard(item);
        },
      ),
    );
  }

  Widget _buildCategoryCard(MenuCategory category) {
    return Card(
      margin: const EdgeInsets.only(bottom: DesignTokens.spaceMD),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
      ),
      child: ExpansionTile(
        leading: CircleAvatar(
          backgroundColor: DesignTokens.primaryColor.withValues(alpha: 0.1),
          child: const Icon(Icons.category, color: DesignTokens.primaryColor),
        ),
        title: Text(
          category.name,
          style: const TextStyle(
            fontWeight: DesignTokens.fontWeightBold,
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          '${category.items.length} articles',
          style: TextStyle(
            color: DesignTokens.textSecondary,
            fontSize: 14,
          ),
        ),
        trailing: PopupMenuButton(
          icon: const Icon(Icons.more_vert),
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 'edit',
              child: Row(
                children: [
                  Icon(Icons.edit, size: 20),
                  SizedBox(width: 8),
                  Text('Modifier'),
                ],
              ),
            ),
            const PopupMenuItem(
              value: 'delete',
              child: Row(
                children: [
                  Icon(Icons.delete, size: 20, color: DesignTokens.errorColor),
                  SizedBox(width: 8),
                  Text('Supprimer', style: TextStyle(color: DesignTokens.errorColor)),
                ],
              ),
            ),
          ],
          onSelected: (value) {
            if (value == 'edit') {
              _showEditCategoryDialog(category);
            } else if (value == 'delete') {
              _showDeleteCategoryConfirmation(category);
            }
          },
        ),
        children: [
          if (category.items.isEmpty)
            Padding(
              padding: const EdgeInsets.all(DesignTokens.spaceMD),
              child: Text(
                'Aucun article dans cette catégorie',
                style: TextStyle(
                  color: DesignTokens.textSecondary,
                  fontStyle: FontStyle.italic,
                ),
              ),
            )
          else
            ...category.items.map((item) => _buildItemListTile(item)),
          Padding(
            padding: const EdgeInsets.all(DesignTokens.spaceSM),
            child: TextButton.icon(
              onPressed: () => _showAddItemDialog(category),
              icon: const Icon(Icons.add),
              label: const Text('Ajouter un article'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItemListTile(MenuItemDetails item) {
    return ListTile(
      leading: item.imageUrl != null
          ? ClipRRect(
              borderRadius: BorderRadius.circular(DesignTokens.radiusSM),
              child: Image.network(
                item.imageUrl!,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  width: 50,
                  height: 50,
                  color: DesignTokens.lightGrey,
                  child: const Icon(Icons.image_not_supported),
                ),
              ),
            )
          : Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: DesignTokens.lightGrey,
                borderRadius: BorderRadius.circular(DesignTokens.radiusSM),
              ),
              child: const Icon(Icons.restaurant),
            ),
      title: Text(item.name),
      subtitle: Text('${item.price} FCFA'),
      trailing: Switch(
        value: item.isAvailable,
        onChanged: (value) => _toggleItemAvailability(item.itemId, value),
        activeColor: DesignTokens.successColor,
      ),
      onTap: () => _showItemDetailDialog(item),
    );
  }

  Widget _buildItemCard(MenuItemDetails item) {
    return Card(
      margin: const EdgeInsets.only(bottom: DesignTokens.spaceMD),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
      ),
      child: Column(
        children: [
          if (item.imageUrl != null)
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(DesignTokens.radiusMD),
              ),
              child: Image.network(
                item.imageUrl!,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  height: 180,
                  color: DesignTokens.lightGrey,
                  child: const Icon(Icons.image_not_supported, size: 48),
                ),
              ),
            ),
          ListTile(
            title: Row(
              children: [
                Expanded(
                  child: Text(
                    item.name,
                    style: const TextStyle(
                      fontWeight: DesignTokens.fontWeightBold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: item.isAvailable
                        ? DesignTokens.successColor.withValues(alpha: 0.1)
                        : DesignTokens.errorColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(DesignTokens.radiusSM),
                  ),
                  child: Text(
                    item.isAvailable ? 'Disponible' : 'Indisponible',
                    style: TextStyle(
                      color: item.isAvailable
                          ? DesignTokens.successColor
                          : DesignTokens.errorColor,
                      fontSize: 12,
                      fontWeight: DesignTokens.fontWeightBold,
                    ),
                  ),
                ),
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text(
                  item.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      '${item.price} FCFA',
                      style: const TextStyle(
                        fontWeight: DesignTokens.fontWeightBold,
                        fontSize: 18,
                        color: DesignTokens.primaryColor,
                      ),
                    ),
                    const Spacer(),
                    // Stock quantity removed - not in model
                  ],
                ),
              ],
            ),
          ),
          OverflowBar(
            alignment: MainAxisAlignment.end,
            children: [
              TextButton.icon(
                onPressed: () => _showEditItemDialog(item),
                icon: const Icon(Icons.edit),
                label: const Text('Modifier'),
              ),
              TextButton.icon(
                onPressed: () => _toggleItemAvailability(item.itemId, !item.isAvailable),
                icon: Icon(item.isAvailable ? Icons.visibility_off : Icons.visibility),
                label: Text(item.isAvailable ? 'Désactiver' : 'Activer'),
              ),
              TextButton.icon(
                onPressed: () => _showDeleteItemConfirmation(item),
                icon: const Icon(Icons.delete, color: DesignTokens.errorColor),
                label: const Text('Supprimer', style: TextStyle(color: DesignTokens.errorColor)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState({
    required IconData icon,
    required String title,
    required String subtitle,
    required String actionLabel,
    required VoidCallback onAction,
  }) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(DesignTokens.spaceXL),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 80,
              color: DesignTokens.textTertiary,
            ),
            const SizedBox(height: DesignTokens.spaceLG),
            Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: DesignTokens.textSecondary,
                  ),
            ),
            const SizedBox(height: DesignTokens.spaceSM),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: DesignTokens.textTertiary,
                  ),
            ),
            const SizedBox(height: DesignTokens.spaceXL),
            ElevatedButton.icon(
              onPressed: onAction,
              icon: const Icon(Icons.add),
              label: Text(actionLabel),
              style: ElevatedButton.styleFrom(
                backgroundColor: DesignTokens.primaryColor,
                foregroundColor: DesignTokens.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: DesignTokens.spaceLG,
                  vertical: DesignTokens.spaceMD,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorView(Object error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(DesignTokens.spaceXL),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 64,
              color: DesignTokens.errorColor,
            ),
            const SizedBox(height: DesignTokens.spaceLG),
            Text(
              'Erreur de chargement',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: DesignTokens.errorColor,
                  ),
            ),
            const SizedBox(height: DesignTokens.spaceSM),
            Text(
              error.toString(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: DesignTokens.textSecondary,
                  ),
            ),
            const SizedBox(height: DesignTokens.spaceLG),
            ElevatedButton.icon(
              onPressed: () {
                ref.invalidate(menuCategoriesProvider(widget.restaurantId));
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Réessayer'),
            ),
          ],
        ),
      ),
    );
  }

  void _showSearchDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Rechercher'),
        content: TextField(
          autofocus: true,
          decoration: const InputDecoration(
            hintText: 'Nom de l\'article...',
            prefixIcon: Icon(Icons.search),
          ),
          onChanged: (value) {
            setState(() {
              _searchQuery = value;
            });
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                _searchQuery = '';
              });
              Navigator.pop(context);
            },
            child: const Text('Effacer'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Fermer'),
          ),
        ],
      ),
    );
  }

  void _showBulkActionsDialog() {
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
              'Actions en lot',
              style: TextStyle(
                fontSize: 18,
                fontWeight: DesignTokens.fontWeightBold,
              ),
            ),
            const SizedBox(height: DesignTokens.spaceMD),
            ListTile(
              leading: const Icon(Icons.visibility),
              title: const Text('Activer tous les articles'),
              onTap: () {
                Navigator.pop(context);
                _bulkUpdateAvailability(true);
              },
            ),
            ListTile(
              leading: const Icon(Icons.visibility_off),
              title: const Text('Désactiver tous les articles'),
              onTap: () {
                Navigator.pop(context);
                _bulkUpdateAvailability(false);
              },
            ),
            ListTile(
              leading: const Icon(Icons.inventory),
              title: const Text('Mettre à jour les stocks'),
              onTap: () {
                Navigator.pop(context);
                _showBulkStockUpdateDialog();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showAddDialog() {
    if (_tabController.index == 0) {
      _showAddCategoryDialog();
    } else {
      final categories = ref.read(menuCategoriesProvider(widget.restaurantId)).value ?? [];
      if (categories.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Créez d\'abord une catégorie'),
            backgroundColor: DesignTokens.warningColor,
          ),
        );
        _tabController.animateTo(0);
      } else {
        _showAddItemDialog(categories[0]);
      }
    }
  }

  void _showAddCategoryDialog() {
    final nameController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Nouvelle Catégorie'),
        content: TextField(
          controller: nameController,
          decoration: const InputDecoration(
            labelText: 'Nom de la catégorie',
            hintText: 'Ex: Entrées, Plats, Desserts...',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler'),
          ),
          ElevatedButton(
            onPressed: () {
              if (nameController.text.isNotEmpty) {
                Navigator.pop(context);
                _createCategory(nameController.text);
              }
            },
            child: const Text('Créer'),
          ),
        ],
      ),
    );
  }

  void _showEditCategoryDialog(MenuCategory category) {
    final nameController = TextEditingController(text: category.name);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Modifier Catégorie'),
        content: TextField(
          controller: nameController,
          decoration: const InputDecoration(
            labelText: 'Nom de la catégorie',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler'),
          ),
          ElevatedButton(
            onPressed: () {
              if (nameController.text.isNotEmpty) {
                Navigator.pop(context);
                _updateCategory(category.copyWith(name: nameController.text));
              }
            },
            child: const Text('Enregistrer'),
          ),
        ],
      ),
    );
  }

  void _showDeleteCategoryConfirmation(MenuCategory category) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Supprimer la catégorie'),
        content: Text(
          'Êtes-vous sûr de vouloir supprimer "${category.name}"?\n\n'
          'Tous les articles de cette catégorie seront également supprimés.',
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
              _deleteCategory(category.categoryId);
            },
            child: const Text('Supprimer'),
          ),
        ],
      ),
    );
  }

  void _showAddItemDialog(MenuCategory? category) async {
    if (category == null) return;

    final nameController = TextEditingController();
    final descriptionController = TextEditingController();
    final priceController = TextEditingController();
    final prepTimeController = TextEditingController();
    final allergensController = TextEditingController();
    final dietaryTagsController = TextEditingController();
    bool isPopular = false;
    File? selectedImage;
    final ImagePicker picker = ImagePicker();

    await showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text('Nouvel Article'),
          content: SingleChildScrollView(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image picker
                  Center(
                    child: GestureDetector(
                      onTap: () async {
                        final XFile? image = await picker.pickImage(
                          source: ImageSource.gallery,
                          maxWidth: 1920,
                          maxHeight: 1080,
                          imageQuality: 85,
                        );
                        if (image != null) {
                          setState(() {
                            selectedImage = File(image.path);
                          });
                        }
                      },
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          color: DesignTokens.lightGrey,
                          borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
                          border: Border.all(color: DesignTokens.primaryColor.withValues(alpha: 0.3)),
                        ),
                        child: selectedImage != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
                                child: Image.file(selectedImage!, fit: BoxFit.cover),
                              )
                            : const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.add_photo_alternate, size: 48, color: DesignTokens.primaryColor),
                                  SizedBox(height: 8),
                                  Text('Ajouter une image', style: TextStyle(color: DesignTokens.primaryColor)),
                                ],
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(height: DesignTokens.spaceMD),

                  // Name field
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: 'Nom de l\'article *',
                      hintText: 'Ex: Pizza Margherita',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: DesignTokens.spaceMD),

                  // Description field
                  TextField(
                    controller: descriptionController,
                    maxLines: 3,
                    decoration: const InputDecoration(
                      labelText: 'Description *',
                      hintText: 'Décrivez votre plat...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: DesignTokens.spaceMD),

                  // Price and prep time
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: priceController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Prix (FCFA) *',
                            hintText: '5000',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(width: DesignTokens.spaceMD),
                      Expanded(
                        child: TextField(
                          controller: prepTimeController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Temps (min) *',
                            hintText: '15',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: DesignTokens.spaceMD),

                  // Allergens
                  TextField(
                    controller: allergensController,
                    decoration: const InputDecoration(
                      labelText: 'Allergènes',
                      hintText: 'Ex: gluten, lactose (séparés par des virgules)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: DesignTokens.spaceMD),

                  // Dietary tags
                  TextField(
                    controller: dietaryTagsController,
                    decoration: const InputDecoration(
                      labelText: 'Tags diététiques',
                      hintText: 'Ex: végétarien, vegan (séparés par des virgules)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: DesignTokens.spaceMD),

                  // Popular checkbox
                  CheckboxListTile(
                    title: const Text('Marquer comme populaire'),
                    value: isPopular,
                    onChanged: (value) {
                      setState(() {
                        isPopular = value ?? false;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Annuler'),
            ),
            ElevatedButton(
              onPressed: () async {
                if (nameController.text.isEmpty ||
                    descriptionController.text.isEmpty ||
                    priceController.text.isEmpty ||
                    prepTimeController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Veuillez remplir tous les champs obligatoires'),
                      backgroundColor: DesignTokens.warningColor,
                    ),
                  );
                  return;
                }

                Navigator.pop(context);
                await _createMenuItem(
                  category,
                  nameController.text,
                  descriptionController.text,
                  double.tryParse(priceController.text) ?? 0,
                  int.tryParse(prepTimeController.text) ?? 15,
                  isPopular,
                  allergensController.text.split(',').map((e) => e.trim()).where((e) => e.isNotEmpty).toList(),
                  dietaryTagsController.text.split(',').map((e) => e.trim()).where((e) => e.isNotEmpty).toList(),
                  selectedImage,
                );
              },
              child: const Text('Créer'),
            ),
          ],
        ),
      ),
    );
  }

  void _showEditItemDialog(MenuItemDetails item) async {
    final nameController = TextEditingController(text: item.name);
    final descriptionController = TextEditingController(text: item.description);
    final priceController = TextEditingController(text: item.price.toString());
    final prepTimeController = TextEditingController(text: item.preparationTime.toString());
    final allergensController = TextEditingController(text: item.allergens.join(', '));
    final dietaryTagsController = TextEditingController(text: item.dietaryTags.join(', '));
    bool isPopular = item.isPopular;
    File? selectedImage;
    final ImagePicker picker = ImagePicker();

    await showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text('Modifier l\'Article'),
          content: SingleChildScrollView(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image picker
                  Center(
                    child: GestureDetector(
                      onTap: () async {
                        final XFile? image = await picker.pickImage(
                          source: ImageSource.gallery,
                          maxWidth: 1920,
                          maxHeight: 1080,
                          imageQuality: 85,
                        );
                        if (image != null) {
                          setState(() {
                            selectedImage = File(image.path);
                          });
                        }
                      },
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          color: DesignTokens.lightGrey,
                          borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
                          border: Border.all(color: DesignTokens.primaryColor.withValues(alpha: 0.3)),
                        ),
                        child: selectedImage != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
                                child: Image.file(selectedImage!, fit: BoxFit.cover),
                              )
                            : item.imageUrl != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
                                    child: Image.network(item.imageUrl!, fit: BoxFit.cover),
                                  )
                                : const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.add_photo_alternate, size: 48, color: DesignTokens.primaryColor),
                                      SizedBox(height: 8),
                                      Text('Changer l\'image', style: TextStyle(color: DesignTokens.primaryColor)),
                                    ],
                                  ),
                      ),
                    ),
                  ),
                  const SizedBox(height: DesignTokens.spaceMD),

                  // Name field
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: 'Nom de l\'article *',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: DesignTokens.spaceMD),

                  // Description field
                  TextField(
                    controller: descriptionController,
                    maxLines: 3,
                    decoration: const InputDecoration(
                      labelText: 'Description *',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: DesignTokens.spaceMD),

                  // Price and prep time
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: priceController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Prix (FCFA) *',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(width: DesignTokens.spaceMD),
                      Expanded(
                        child: TextField(
                          controller: prepTimeController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Temps (min) *',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: DesignTokens.spaceMD),

                  // Allergens
                  TextField(
                    controller: allergensController,
                    decoration: const InputDecoration(
                      labelText: 'Allergènes',
                      hintText: 'Séparés par des virgules',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: DesignTokens.spaceMD),

                  // Dietary tags
                  TextField(
                    controller: dietaryTagsController,
                    decoration: const InputDecoration(
                      labelText: 'Tags diététiques',
                      hintText: 'Séparés par des virgules',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: DesignTokens.spaceMD),

                  // Popular checkbox
                  CheckboxListTile(
                    title: const Text('Marquer comme populaire'),
                    value: isPopular,
                    onChanged: (value) {
                      setState(() {
                        isPopular = value ?? false;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Annuler'),
            ),
            ElevatedButton(
              onPressed: () async {
                if (nameController.text.isEmpty ||
                    descriptionController.text.isEmpty ||
                    priceController.text.isEmpty ||
                    prepTimeController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Veuillez remplir tous les champs obligatoires'),
                      backgroundColor: DesignTokens.warningColor,
                    ),
                  );
                  return;
                }

                Navigator.pop(context);
                await _updateMenuItem(
                  item.copyWith(
                    name: nameController.text,
                    description: descriptionController.text,
                    price: double.tryParse(priceController.text) ?? item.price,
                    preparationTime: int.tryParse(prepTimeController.text) ?? item.preparationTime,
                    isPopular: isPopular,
                    allergens: allergensController.text.split(',').map((e) => e.trim()).where((e) => e.isNotEmpty).toList(),
                    dietaryTags: dietaryTagsController.text.split(',').map((e) => e.trim()).where((e) => e.isNotEmpty).toList(),
                  ),
                  selectedImage,
                );
              },
              child: const Text('Enregistrer'),
            ),
          ],
        ),
      ),
    );
  }

  void _showItemDetailDialog(MenuItemDetails item) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Expanded(
              child: Text(
                item.name,
                style: const TextStyle(fontSize: 20),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: item.isAvailable
                    ? DesignTokens.successColor.withValues(alpha: 0.1)
                    : DesignTokens.errorColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(DesignTokens.radiusSM),
              ),
              child: Text(
                item.isAvailable ? 'Disponible' : 'Indisponible',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: DesignTokens.fontWeightBold,
                  color: item.isAvailable ? DesignTokens.successColor : DesignTokens.errorColor,
                ),
              ),
            ),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image
              if (item.imageUrl != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
                  child: Image.network(
                    item.imageUrl!,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      height: 200,
                      color: DesignTokens.lightGrey,
                      child: const Center(child: Icon(Icons.image_not_supported, size: 48)),
                    ),
                  ),
                ),
              const SizedBox(height: DesignTokens.spaceMD),

              // Description
              const Text(
                'Description',
                style: TextStyle(fontWeight: DesignTokens.fontWeightBold, fontSize: 16),
              ),
              const SizedBox(height: 4),
              Text(item.description),
              const SizedBox(height: DesignTokens.spaceMD),

              // Price and prep time
              Row(
                children: [
                  Expanded(
                    child: _buildDetailCard('Prix', '${item.price} FCFA', Icons.monetization_on),
                  ),
                  const SizedBox(width: DesignTokens.spaceSM),
                  Expanded(
                    child: _buildDetailCard('Préparation', '${item.preparationTime} min', Icons.timer),
                  ),
                ],
              ),
              const SizedBox(height: DesignTokens.spaceMD),

              // Stats
              Row(
                children: [
                  Expanded(
                    child: _buildDetailCard('Commandes', '${item.orderCount}', Icons.shopping_bag),
                  ),
                  const SizedBox(width: DesignTokens.spaceSM),
                  Expanded(
                    child: _buildDetailCard('Note', '${item.rating.toStringAsFixed(1)}/5', Icons.star),
                  ),
                ],
              ),
              const SizedBox(height: DesignTokens.spaceMD),

              // Allergens
              if (item.allergens.isNotEmpty) ...[
                const Text(
                  'Allergènes',
                  style: TextStyle(fontWeight: DesignTokens.fontWeightBold, fontSize: 16),
                ),
                const SizedBox(height: 4),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: item.allergens.map((allergen) => Chip(
                    label: Text(allergen),
                    backgroundColor: DesignTokens.warningColor.withValues(alpha: 0.1),
                    labelStyle: const TextStyle(fontSize: 12),
                  )).toList(),
                ),
                const SizedBox(height: DesignTokens.spaceMD),
              ],

              // Dietary tags
              if (item.dietaryTags.isNotEmpty) ...[
                const Text(
                  'Tags diététiques',
                  style: TextStyle(fontWeight: DesignTokens.fontWeightBold, fontSize: 16),
                ),
                const SizedBox(height: 4),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: item.dietaryTags.map((tag) => Chip(
                    label: Text(tag),
                    backgroundColor: DesignTokens.successColor.withValues(alpha: 0.1),
                    labelStyle: const TextStyle(fontSize: 12),
                  )).toList(),
                ),
                const SizedBox(height: DesignTokens.spaceMD),
              ],

              // Popular badge
              if (item.isPopular)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: DesignTokens.primaryColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(DesignTokens.radiusSM),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.local_fire_department, size: 16, color: DesignTokens.primaryColor),
                      SizedBox(width: 4),
                      Text(
                        'Article Populaire',
                        style: TextStyle(
                          color: DesignTokens.primaryColor,
                          fontWeight: DesignTokens.fontWeightBold,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Fermer'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _showEditItemDialog(item);
            },
            child: const Text('Modifier'),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailCard(String label, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(DesignTokens.spaceSM),
      decoration: BoxDecoration(
        color: DesignTokens.lightGrey.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(DesignTokens.radiusSM),
      ),
      child: Column(
        children: [
          Icon(icon, size: 20, color: DesignTokens.primaryColor),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: DesignTokens.textSecondary,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: DesignTokens.fontWeightBold,
            ),
          ),
        ],
      ),
    );
  }

  void _showDeleteItemConfirmation(MenuItemDetails item) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Supprimer l\'article'),
        content: Text('Êtes-vous sûr de vouloir supprimer "${item.name}"?'),
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
              _deleteItem(item.itemId);
            },
            child: const Text('Supprimer'),
          ),
        ],
      ),
    );
  }

  void _showBulkStockUpdateDialog() {
    final categories = ref.read(menuCategoriesProvider(widget.restaurantId)).value ?? [];
    final allItems = categories.expand((cat) => cat.items).toList();

    if (allItems.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Aucun article disponible'),
          backgroundColor: DesignTokens.warningColor,
        ),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Mise à jour en lot'),
        content: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Sélectionnez une action à appliquer à tous les articles:',
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(height: DesignTokens.spaceMD),
                ListTile(
                  leading: const Icon(Icons.visibility, color: DesignTokens.successColor),
                  title: const Text('Activer tous les articles'),
                  subtitle: Text('${allItems.length} articles seront disponibles'),
                  onTap: () {
                    Navigator.pop(context);
                    _bulkUpdateAvailability(true);
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.visibility_off, color: DesignTokens.errorColor),
                  title: const Text('Désactiver tous les articles'),
                  subtitle: Text('${allItems.length} articles seront indisponibles'),
                  onTap: () {
                    Navigator.pop(context);
                    _bulkUpdateAvailability(false);
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.local_fire_department, color: DesignTokens.primaryColor),
                  title: const Text('Marquer tous comme populaires'),
                  subtitle: const Text('Tous les articles seront mis en avant'),
                  onTap: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Cette fonction nécessite une mise à jour individuelle des articles'),
                        backgroundColor: DesignTokens.infoColor,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
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

  // API Methods
  Future<void> _createCategory(String name) async {
    final category = MenuCategory(
      categoryId: '',
      name: name,
      description: '',
      sortOrder: 0,
      isActive: true,
      items: [],
    );

    final result = await ref
        .read(restaurantOwnerProvider(widget.restaurantId).notifier)
        .createMenuCategory(category);

    result.when(
      success: (_) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Catégorie créée avec succès'),
            backgroundColor: DesignTokens.successColor,
          ),
        );
        ref.invalidate(menuCategoriesProvider(widget.restaurantId));
      },
      failure: (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erreur: $error'),
            backgroundColor: DesignTokens.errorColor,
          ),
        );
      },
    );
  }

  Future<void> _updateCategory(MenuCategory category) async {
    final result = await ref
        .read(restaurantOwnerProvider(widget.restaurantId).notifier)
        .updateMenuCategory(category);

    result.when(
      success: (_) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Catégorie mise à jour'),
            backgroundColor: DesignTokens.successColor,
          ),
        );
        ref.invalidate(menuCategoriesProvider(widget.restaurantId));
      },
      failure: (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erreur: $error'),
            backgroundColor: DesignTokens.errorColor,
          ),
        );
      },
    );
  }

  Future<void> _deleteCategory(String categoryId) async {
    final result = await ref
        .read(restaurantOwnerProvider(widget.restaurantId).notifier)
        .deleteMenuCategory(categoryId);

    result.when(
      success: (_) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Catégorie supprimée'),
            backgroundColor: DesignTokens.successColor,
          ),
        );
        ref.invalidate(menuCategoriesProvider(widget.restaurantId));
      },
      failure: (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erreur: $error'),
            backgroundColor: DesignTokens.errorColor,
          ),
        );
      },
    );
  }

  Future<void> _deleteItem(String itemId) async {
    final result = await ref
        .read(restaurantOwnerProvider(widget.restaurantId).notifier)
        .deleteMenuItem(itemId);

    result.when(
      success: (_) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Article supprimé'),
            backgroundColor: DesignTokens.successColor,
          ),
        );
        ref.invalidate(menuCategoriesProvider(widget.restaurantId));
      },
      failure: (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erreur: $error'),
            backgroundColor: DesignTokens.errorColor,
          ),
        );
      },
    );
  }

  Future<void> _toggleItemAvailability(String itemId, bool isAvailable) async {
    final result = await ref
        .read(restaurantOwnerProvider(widget.restaurantId).notifier)
        .toggleItemAvailability(itemId, isAvailable);

    result.when(
      success: (_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(isAvailable ? 'Article activé' : 'Article désactivé'),
            backgroundColor: DesignTokens.successColor,
          ),
        );
        ref.invalidate(menuCategoriesProvider(widget.restaurantId));
      },
      failure: (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erreur: $error'),
            backgroundColor: DesignTokens.errorColor,
          ),
        );
      },
    );
  }

  Future<void> _bulkUpdateAvailability(bool isAvailable) async {
    final categories = ref.read(menuCategoriesProvider(widget.restaurantId)).value ?? [];
    final allItemIds = categories
        .expand((cat) => cat.items)
        .map((item) => item.itemId)
        .toList();

    if (allItemIds.isEmpty) return;

    final result = await ref
        .read(restaurantOwnerProvider(widget.restaurantId).notifier)
        .bulkUpdateAvailability(allItemIds, isAvailable);

    result.when(
      success: (_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              isAvailable
                  ? 'Tous les articles sont maintenant disponibles'
                  : 'Tous les articles sont maintenant indisponibles',
            ),
            backgroundColor: DesignTokens.successColor,
          ),
        );
        ref.invalidate(menuCategoriesProvider(widget.restaurantId));
      },
      failure: (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erreur: $error'),
            backgroundColor: DesignTokens.errorColor,
          ),
        );
      },
    );
  }

  Future<void> _createMenuItem(
    MenuCategory category,
    String name,
    String description,
    double price,
    int preparationTime,
    bool isPopular,
    List<String> allergens,
    List<String> dietaryTags,
    File? imageFile,
  ) async {
    final item = MenuItemDetails(
      itemId: '',
      name: name,
      description: description,
      price: price,
      isAvailable: true,
      isPopular: isPopular,
      preparationTime: preparationTime,
      allergens: allergens,
      dietaryTags: dietaryTags,
    );

    final result = await ref
        .read(restaurantOwnerProvider(widget.restaurantId).notifier)
        .createMenuItem(category.categoryId, item);

    await result.when(
      success: (createdItem) async {
        // Upload image if provided
        if (imageFile != null && createdItem.itemId.isNotEmpty) {
          final imageResult = await ref
              .read(restaurantOwnerProvider(widget.restaurantId).notifier)
              .uploadItemImage(createdItem.itemId, imageFile);

          imageResult.when(
            success: (_) {},
            failure: (error) {
              if (mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Article créé mais erreur lors de l\'upload de l\'image: $error'),
                    backgroundColor: DesignTokens.warningColor,
                  ),
                );
              }
            },
          );
        }

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Article créé avec succès'),
              backgroundColor: DesignTokens.successColor,
            ),
          );
        }
        ref.invalidate(menuCategoriesProvider(widget.restaurantId));
      },
      failure: (error) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Erreur: $error'),
              backgroundColor: DesignTokens.errorColor,
            ),
          );
        }
      },
    );
  }

  Future<void> _updateMenuItem(MenuItemDetails item, File? imageFile) async {
    final result = await ref
        .read(restaurantOwnerProvider(widget.restaurantId).notifier)
        .updateMenuItem(item);

    await result.when(
      success: (_) async {
        // Upload image if provided
        if (imageFile != null) {
          final imageResult = await ref
              .read(restaurantOwnerProvider(widget.restaurantId).notifier)
              .uploadItemImage(item.itemId, imageFile);

          imageResult.when(
            success: (_) {},
            failure: (error) {
              if (mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Article mis à jour mais erreur lors de l\'upload de l\'image: $error'),
                    backgroundColor: DesignTokens.warningColor,
                  ),
                );
              }
            },
          );
        }

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Article mis à jour'),
              backgroundColor: DesignTokens.successColor,
            ),
          );
        }
        ref.invalidate(menuCategoriesProvider(widget.restaurantId));
      },
      failure: (error) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Erreur: $error'),
              backgroundColor: DesignTokens.errorColor,
            ),
          );
        }
      },
    );
  }
}
