import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/design_tokens.dart';
import '../../../../shared/widgets/loading/app_loading_indicator.dart';
import '../../domain/models/restaurant.dart';
import '../../domain/models/menu_item.dart';
import '../../providers/restaurant_provider.dart';
import '../widgets/menu_item_card.dart';

class RestaurantDetailScreen extends ConsumerStatefulWidget {
  final String restaurantId;

  const RestaurantDetailScreen({
    super.key,
    required this.restaurantId,
  });

  @override
  ConsumerState<RestaurantDetailScreen> createState() => _RestaurantDetailScreenState();
}

class _RestaurantDetailScreenState extends ConsumerState<RestaurantDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String? _selectedCategoryId;

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
    final restaurantAsync = ref.watch(restaurantDetailProvider(widget.restaurantId));
    final categoriesAsync = ref.watch(menuCategoriesProvider(widget.restaurantId));
    final favoriteRestaurants = ref.watch(favoriteRestaurantsProvider);

    return Scaffold(
      backgroundColor: DesignTokens.backgroundPrimary,
      body: restaurantAsync.when(
        loading: () => const AppLoadingIndicator(),
        error: (error, stackTrace) => _buildErrorState(error.toString()),
        data: (restaurant) {
          if (restaurant == null) {
            return _buildErrorState('Restaurant non trouvé');
          }
          
          return _buildRestaurantDetail(restaurant, categoriesAsync, favoriteRestaurants);
        },
      ),
    );
  }

  Widget _buildErrorState(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 64,
            color: DesignTokens.errorColor.withOpacity(0.5),
          ),
          const SizedBox(height: DesignTokens.spaceMD),
          Text(
            'Erreur',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: DesignTokens.spaceSM),
          Text(
            message,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: DesignTokens.textSecondary,
            ),
          ),
          const SizedBox(height: DesignTokens.spaceLG),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Retour'),
          ),
        ],
      ),
    );
  }

  Widget _buildRestaurantDetail(
    Restaurant restaurant,
    AsyncValue<List<MenuCategory>> categoriesAsync,
    Set<String> favoriteRestaurants,
  ) {
    return CustomScrollView(
      slivers: [
        // Header with image
        _buildSliverAppBar(restaurant, favoriteRestaurants),
        
        // Restaurant info
        SliverToBoxAdapter(
          child: _buildRestaurantInfo(restaurant),
        ),
        
        // Tab bar
        SliverPersistentHeader(
          pinned: true,
          delegate: _SliverTabBarDelegate(
            TabBar(
              controller: _tabController,
              labelColor: DesignTokens.primaryColor,
              unselectedLabelColor: DesignTokens.textSecondary,
              indicatorColor: DesignTokens.primaryColor,
              tabs: const [
                Tab(text: 'Menu'),
                Tab(text: 'Informations'),
              ],
            ),
          ),
        ),
        
        // Tab content
        SliverFillRemaining(
          child: TabBarView(
            controller: _tabController,
            children: [
              // Menu tab
              _buildMenuTab(categoriesAsync),
              // Info tab
              _buildInfoTab(restaurant),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSliverAppBar(Restaurant restaurant, Set<String> favoriteRestaurants) {
    return SliverAppBar(
      expandedHeight: 250,
      pinned: true,
      backgroundColor: DesignTokens.primaryColor,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            CachedNetworkImage(
              imageUrl: restaurant.imageUrl,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                color: DesignTokens.lightGrey.withOpacity(0.3),
                child: const Center(
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
              errorWidget: (context, url, error) => Container(
                color: DesignTokens.lightGrey.withOpacity(0.3),
                child: const Icon(
                  Icons.restaurant,
                  size: 64,
                  color: DesignTokens.textTertiary,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.7),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.name,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: DesignTokens.white,
                      fontWeight: DesignTokens.fontWeightBold,
                    ),
                  ),
                  const SizedBox(height: DesignTokens.spaceXS),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: DesignTokens.warningColor,
                        size: 20,
                      ),
                      const SizedBox(width: DesignTokens.spaceXS),
                      Text(
                        restaurant.rating.toString(),
                        style: const TextStyle(
                          color: DesignTokens.white,
                          fontWeight: DesignTokens.fontWeightMedium,
                        ),
                      ),
                      const SizedBox(width: DesignTokens.spaceXS),
                      Text(
                        '(${restaurant.reviewCount} avis)',
                        style: TextStyle(
                          color: DesignTokens.white.withOpacity(0.8),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: DesignTokens.spaceSM,
                          vertical: DesignTokens.spaceXS,
                        ),
                        decoration: BoxDecoration(
                          color: restaurant.isOpen ? DesignTokens.successColor : DesignTokens.errorColor,
                          borderRadius: BorderRadius.circular(DesignTokens.radiusSM),
                        ),
                        child: Text(
                          restaurant.isOpen ? 'OUVERT' : 'FERMÉ',
                          style: const TextStyle(
                            color: DesignTokens.white,
                            fontSize: DesignTokens.fontSizeXS,
                            fontWeight: DesignTokens.fontWeightBold,
                          ),
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
      actions: [
        IconButton(
          icon: Icon(
            favoriteRestaurants.contains(restaurant.id) ? Icons.favorite : Icons.favorite_border,
            color: favoriteRestaurants.contains(restaurant.id) ? DesignTokens.errorColor : DesignTokens.white,
          ),
          onPressed: () => _toggleFavorite(restaurant.id),
        ),
        IconButton(
          icon: const Icon(Icons.share, color: DesignTokens.white),
          onPressed: () => _shareRestaurant(restaurant),
        ),
      ],
    );
  }

  Widget _buildRestaurantInfo(Restaurant restaurant) {
    return Container(
      color: DesignTokens.white,
      padding: const EdgeInsets.all(DesignTokens.spaceLG),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            restaurant.description,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              height: 1.5,
            ),
          ),
          const SizedBox(height: DesignTokens.spaceLG),
          Row(
            children: [
              _buildInfoChip(
                icon: Icons.access_time,
                text: '${restaurant.estimatedDeliveryTime} min',
                color: DesignTokens.primaryColor,
              ),
              const SizedBox(width: DesignTokens.spaceMD),
              _buildInfoChip(
                icon: Icons.delivery_dining,
                text: '${restaurant.deliveryFee} FCFA',
                color: DesignTokens.secondaryColor,
              ),
              const SizedBox(width: DesignTokens.spaceMD),
              _buildInfoChip(
                icon: Icons.attach_money,
                text: restaurant.priceRange,
                color: DesignTokens.accentColor,
              ),
            ],
          ),
          const SizedBox(height: DesignTokens.spaceLG),
          Wrap(
            spacing: DesignTokens.spaceXS,
            runSpacing: DesignTokens.spaceXS,
            children: restaurant.cuisineTypes.map((cuisineType) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: DesignTokens.spaceSM,
                  vertical: DesignTokens.spaceXS,
                ),
                decoration: BoxDecoration(
                  color: DesignTokens.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(DesignTokens.radiusSM),
                ),
                child: Text(
                  cuisineType,
                  style: const TextStyle(
                    color: DesignTokens.primaryColor,
                    fontSize: DesignTokens.fontSizeSM,
                    fontWeight: DesignTokens.fontWeightMedium,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoChip({required IconData icon, required String text, required Color color}) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: DesignTokens.spaceSM,
        vertical: DesignTokens.spaceXS,
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(DesignTokens.radiusSM),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: DesignTokens.spaceXS),
          Text(
            text,
            style: TextStyle(
              color: color,
              fontSize: DesignTokens.fontSizeSM,
              fontWeight: DesignTokens.fontWeightMedium,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuTab(AsyncValue<List<MenuCategory>> categoriesAsync) {
    return categoriesAsync.when(
      loading: () => const AppLoadingIndicator(),
      error: (error, stackTrace) => Center(
        child: Text('Erreur de chargement du menu: ${error.toString()}'),
      ),
      data: (categories) {
        if (categories.isEmpty) {
          return const Center(
            child: Text('Aucune catégorie de menu disponible'),
          );
        }

        // Set default selected category
        if (_selectedCategoryId == null && categories.isNotEmpty) {
          _selectedCategoryId = categories.first.id;
        }

        return Column(
          children: [
            // Category tabs
            if (categories.length > 1) _buildCategoryTabs(categories),
            
            // Menu items
            Expanded(
              child: _buildMenuItems(),
            ),
          ],
        );
      },
    );
  }

  Widget _buildCategoryTabs(List<MenuCategory> categories) {
    return Container(
      height: 50,
      color: DesignTokens.white,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: DesignTokens.spaceMD),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = _selectedCategoryId == category.id;
          
          return Padding(
            padding: const EdgeInsets.only(right: DesignTokens.spaceMD),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedCategoryId = category.id;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: DesignTokens.spaceMD,
                    vertical: DesignTokens.spaceXS,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected ? DesignTokens.primaryColor : Colors.transparent,
                    borderRadius: BorderRadius.circular(DesignTokens.radiusLG),
                  ),
                  child: Text(
                    category.name,
                    style: TextStyle(
                      color: isSelected ? DesignTokens.white : DesignTokens.textSecondary,
                      fontWeight: isSelected 
                        ? DesignTokens.fontWeightSemiBold 
                        : DesignTokens.fontWeightMedium,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildMenuItems() {
    if (_selectedCategoryId == null) {
      return const Center(child: Text('Aucune catégorie sélectionnée'));
    }

    final menuItemsAsync = ref.watch(menuItemsProvider(
      MenuItemsParams(
        restaurantId: widget.restaurantId,
        categoryId: _selectedCategoryId,
      ),
    ));

    return menuItemsAsync.when(
      loading: () => const AppLoadingIndicator(),
      error: (error, stackTrace) => Center(
        child: Text('Erreur de chargement des articles: ${error.toString()}'),
      ),
      data: (menuItems) {
        if (menuItems.isEmpty) {
          return const Center(
            child: Text('Aucun article disponible dans cette catégorie'),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(DesignTokens.spaceMD),
          itemCount: menuItems.length,
          itemBuilder: (context, index) {
            final menuItem = menuItems[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: DesignTokens.spaceMD),
              child: MenuItemCard(
                menuItem: menuItem,
                onTap: () => _showMenuItemDetail(menuItem),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildInfoTab(Restaurant restaurant) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(DesignTokens.spaceLG),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoSection('Adresse', [
            (restaurant.address.street),
            '${restaurant.address.district}, ${restaurant.address.city}',
            if (restaurant.address.landmark != null) restaurant.address.landmark!,
          ]),
          
          const SizedBox(height: DesignTokens.spaceXL),
          
          _buildInfoSection('Contact', [
            restaurant.phoneNumber,
          ]),
          
          const SizedBox(height: DesignTokens.spaceXL),
          
          _buildInfoSection('Horaires', restaurant.operatingHours),
          
          const SizedBox(height: DesignTokens.spaceXL),
          
          _buildInfoSection('Spécialités', restaurant.specialties),
          
          const SizedBox(height: DesignTokens.spaceXL),
          
          _buildInfoSection('Moyens de paiement', restaurant.paymentMethods),
        ],
      ),
    );
  }

  Widget _buildInfoSection(String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: DesignTokens.fontWeightSemiBold,
          ),
        ),
        const SizedBox(height: DesignTokens.spaceSM),
        ...items.map((item) => Padding(
          padding: const EdgeInsets.only(bottom: DesignTokens.spaceXS),
          child: Row(
            children: [
              Container(
                width: 4,
                height: 4,
                decoration: const BoxDecoration(
                  color: DesignTokens.primaryColor,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: DesignTokens.spaceSM),
              Expanded(
                child: Text(
                  item,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        )),
      ],
    );
  }

  void _toggleFavorite(String restaurantId) {
    ref.read(favoriteRestaurantsProvider.notifier).toggleFavorite(restaurantId);
    
    final isFavorite = ref.read(favoriteRestaurantsProvider).contains(restaurantId);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          isFavorite 
            ? 'Restaurant ajouté aux favoris'
            : 'Restaurant retiré des favoris',
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _shareRestaurant(Restaurant restaurant) {
    // Implement share functionality
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Partage de ${restaurant.name}'),
      ),
    );
  }

  void _showMenuItemDetail(MenuItem menuItem) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => MenuItemDetailBottomSheet(menuItem: menuItem),
    );
  }
}

// Helper delegate for sticky tab bar
class _SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  _SliverTabBarDelegate(this._tabBar);

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: DesignTokens.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverTabBarDelegate oldDelegate) {
    return false;
  }
}

// Menu item detail bottom sheet
class MenuItemDetailBottomSheet extends StatelessWidget {
  final MenuItem menuItem;

  const MenuItemDetailBottomSheet({
    super.key,
    required this.menuItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: const BoxDecoration(
        color: DesignTokens.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(DesignTokens.radiusXL),
          topRight: Radius.circular(DesignTokens.radiusXL),
        ),
      ),
      child: Column(
        children: [
          // Handle
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.only(top: DesignTokens.spaceMD),
            decoration: BoxDecoration(
              color: DesignTokens.lightGrey,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          
          // Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(DesignTokens.spaceLG),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(DesignTokens.radiusLG),
                    child: CachedNetworkImage(
                      imageUrl: menuItem.imageUrl,
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(
                        height: 200,
                        color: DesignTokens.lightGrey.withOpacity(0.3),
                        child: const Center(
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      ),
                      errorWidget: (context, url, error) => Container(
                        height: 200,
                        color: DesignTokens.lightGrey.withOpacity(0.3),
                        child: const Icon(
                          Icons.fastfood,
                          size: 64,
                          color: DesignTokens.textTertiary,
                        ),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: DesignTokens.spaceLG),
                  
                  // Title and price
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          menuItem.name,
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: DesignTokens.fontWeightBold,
                          ),
                        ),
                      ),
                      Text(
                        '${menuItem.price.toInt()} FCFA',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: DesignTokens.primaryColor,
                          fontWeight: DesignTokens.fontWeightBold,
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: DesignTokens.spaceMD),
                  
                  // Description
                  Text(
                    menuItem.description,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      height: 1.5,
                    ),
                  ),
                  
                  const SizedBox(height: DesignTokens.spaceLG),
                  
                  // Tags and info
                  if (menuItem.dietaryTags.isNotEmpty) ...[
                    Wrap(
                      spacing: DesignTokens.spaceXS,
                      runSpacing: DesignTokens.spaceXS,
                      children: menuItem.dietaryTags.map((tag) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: DesignTokens.spaceSM,
                            vertical: DesignTokens.spaceXS,
                          ),
                          decoration: BoxDecoration(
                            color: DesignTokens.successColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(DesignTokens.radiusSM),
                          ),
                          child: Text(
                            tag.name,
                            style: const TextStyle(
                              color: DesignTokens.successColor,
                              fontSize: DesignTokens.fontSizeXS,
                              fontWeight: DesignTokens.fontWeightMedium,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    
                    const SizedBox(height: DesignTokens.spaceLG),
                  ],
                  
                  // Additional info
                  Row(
                    children: [
                      if (menuItem.preparationTime > 0) ...[
                        const Icon(
                          Icons.access_time,
                          size: 16,
                          color: DesignTokens.textSecondary,
                        ),
                        const SizedBox(width: DesignTokens.spaceXS),
                        Text(
                          '${menuItem.preparationTime} min',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: DesignTokens.textSecondary,
                          ),
                        ),
                        const SizedBox(width: DesignTokens.spaceMD),
                      ],
                      
                      if (menuItem.calories > 0) ...[
                        const Icon(
                          Icons.local_fire_department,
                          size: 16,
                          color: DesignTokens.textSecondary,
                        ),
                        const SizedBox(width: DesignTokens.spaceXS),
                        Text(
                          '${menuItem.calories.toInt()} cal',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: DesignTokens.textSecondary,
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ),
          
          // Add to cart button
          Container(
            padding: const EdgeInsets.all(DesignTokens.spaceLG),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                  // TODO: Add to cart functionality
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${menuItem.name} ajouté au panier'),
                    ),
                  );
                },
                icon: const Icon(Icons.add_shopping_cart),
                label: Text('Ajouter au panier - ${menuItem.price.toInt()} FCFA'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

extension DietaryTagExtension on DietaryTag {
  String get name {
    switch (this) {
      case DietaryTag.vegetarian:
        return 'Végétarien';
      case DietaryTag.vegan:
        return 'Végan';
      case DietaryTag.glutenFree:
        return 'Sans gluten';
      case DietaryTag.dairyFree:
        return 'Sans lactose';
      case DietaryTag.halal:
        return 'Halal';
      case DietaryTag.kosher:
        return 'Kosher';
      case DietaryTag.spicy:
        return 'Pimenté';
      case DietaryTag.healthy:
        return 'Sain';
      case DietaryTag.organic:
        return 'Bio';
    }
  }
}