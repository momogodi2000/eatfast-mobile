import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/design_tokens.dart';
import '../../../../core/router/route_names.dart';
import '../../../restaurants/providers/restaurant_provider.dart';
import '../../../restaurants/domain/models/restaurant.dart';
import '../../../orders/providers/order_provider.dart';
import '../widgets/active_order_card.dart';
import '../widgets/popular_restaurants_section.dart';
import '../widgets/featured_dishes_section.dart';
import '../../../restaurants/presentation/screens/restaurant_list_screen.dart';
import '../../../orders/presentation/screens/order_history_screen.dart';

/// Home Screen - Main application screen
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DesignTokens.backgroundPrimary,
      appBar: AppBar(
        backgroundColor: DesignTokens.primaryColor,
        elevation: 0,
        title: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: DesignTokens.white.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.restaurant,
                color: DesignTokens.white,
                size: 20,
              ),
            ),
            const SizedBox(width: DesignTokens.spaceXS),
            Text(
              AppConstants.appName,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: DesignTokens.white,
                fontWeight: DesignTokens.fontWeightBold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_outlined,
              color: DesignTokens.white,
            ),
            onPressed: () {
              // TODO: Navigate to notifications
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.person_outline,
              color: DesignTokens.white,
            ),
            onPressed: () {
              setState(() {
                _selectedIndex = 3;
              });
            },
          ),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          _HomeContent(),
          RestaurantListScreen(),
          OrderHistoryScreen(),
          _ProfileContent(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedItemColor: DesignTokens.primaryColor,
        unselectedItemColor: DesignTokens.textSecondary,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_outlined),
            activeIcon: Icon(Icons.restaurant),
            label: 'Restaurants',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long_outlined),
            activeIcon: Icon(Icons.receipt_long),
            label: 'Commandes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}

class _HomeContent extends ConsumerWidget {
  const _HomeContent();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(DesignTokens.spaceLG),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Welcome Message
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(DesignTokens.spaceLG),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  DesignTokens.primaryColor,
                  DesignTokens.primaryColor.withOpacity(0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(DesignTokens.radiusLG),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bonjour ! 👋',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: DesignTokens.white,
                    fontWeight: DesignTokens.fontWeightBold,
                  ),
                ),
                const SizedBox(height: DesignTokens.spaceXS),
                Text(
                  'Que souhaitez-vous déguster aujourd\'hui ?',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: DesignTokens.white.withOpacity(0.9),
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: DesignTokens.spaceXL),
          
          // Search Bar
          Container(
            decoration: BoxDecoration(
              color: DesignTokens.lightGrey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(DesignTokens.radiusLG),
              border: Border.all(
                color: DesignTokens.lightGrey.withOpacity(0.3),
              ),
            ),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Rechercher des plats, restaurants...',
                prefixIcon: Icon(Icons.search),
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(DesignTokens.spaceMD),
              ),
              onTap: () {
                context.go('/restaurants?search=true');
              },
              readOnly: true,
            ),
          ),
          
          const SizedBox(height: DesignTokens.spaceXL),
          
          // Active Order Card
          const ActiveOrderCard(),
          
          const SizedBox(height: DesignTokens.spaceXL),
          
          // Quick Actions
          Row(
            children: [
              Expanded(
                child: _buildQuickActionCard(
                  context,
                  icon: Icons.restaurant,
                  title: 'Restaurants',
                  subtitle: 'Parcourir tous',
                  onTap: () => context.go('/restaurants'),
                ),
              ),
              const SizedBox(width: DesignTokens.spaceMD),
              Expanded(
                child: _buildQuickActionCard(
                  context,
                  icon: Icons.local_offer,
                  title: 'Offres',
                  subtitle: 'Promotions',
                  onTap: () => context.go('/restaurants?filter=promotions'),
                ),
              ),
            ],
          ),
          
          const SizedBox(height: DesignTokens.spaceXL),
          
          // Categories
          Text(
            'Catégories',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: DesignTokens.fontWeightBold,
            ),
          ),
          
          const SizedBox(height: DesignTokens.spaceMD),
          
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: AppConstants.foodCategories.length,
              itemBuilder: (context, index) {
                final category = AppConstants.foodCategories[index];
                return GestureDetector(
                  onTap: () {
                    context.go('/restaurants?category=${Uri.encodeComponent(category)}');
                  },
                  child: Container(
                    width: 80,
                    margin: const EdgeInsets.only(right: DesignTokens.spaceMD),
                    child: Column(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: DesignTokens.primaryColor.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            _getCategoryIcon(category),
                            color: DesignTokens.primaryColor,
                          ),
                        ),
                        const SizedBox(height: DesignTokens.spaceXS),
                        Text(
                          category,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodySmall,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          
          const SizedBox(height: DesignTokens.spaceXL),
          
          // Popular Restaurants
          const PopularRestaurantsSection(),
          
          const SizedBox(height: DesignTokens.spaceXL),
          
          // Featured Dishes
          const FeaturedDishesSection(),
        ],
      ),
    );
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'Plats Traditionnels':
        return Icons.rice_bowl;
      case 'Fast Food':
        return Icons.fastfood;
      case 'Boissons':
        return Icons.local_drink;
      case 'Desserts':
        return Icons.cake;
      case 'Fruits':
        return Icons.apple;
      case 'Petit Déjeuner':
        return Icons.free_breakfast;
      case 'Déjeuner':
        return Icons.lunch_dining;
      case 'Dîner':
        return Icons.dinner_dining;
      default:
        return Icons.restaurant;
    }
  }

  Widget _buildQuickActionCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(DesignTokens.spaceLG),
        decoration: BoxDecoration(
          color: DesignTokens.white,
          borderRadius: BorderRadius.circular(DesignTokens.radiusLG),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(DesignTokens.spaceMD),
              decoration: BoxDecoration(
                color: DesignTokens.primaryColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: DesignTokens.primaryColor,
                size: 24,
              ),
            ),
            const SizedBox(height: DesignTokens.spaceSM),
            Text(
              title,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: DesignTokens.fontWeightSemiBold,
              ),
            ),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: DesignTokens.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class _ProfileContent extends StatelessWidget {
  const _ProfileContent();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(DesignTokens.spaceLG),
      child: Column(
        children: [
          // Profile Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(DesignTokens.spaceLG),
            decoration: BoxDecoration(
              color: DesignTokens.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(DesignTokens.radiusLG),
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: DesignTokens.primaryColor.withOpacity(0.2),
                  child: const Icon(
                    Icons.person,
                    size: 50,
                    color: DesignTokens.primaryColor,
                  ),
                ),
                const SizedBox(height: DesignTokens.spaceMD),
                Text(
                  'Utilisateur EatFast',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: DesignTokens.fontWeightBold,
                  ),
                ),
                Text(
                  'user@eatfast.cm',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: DesignTokens.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: DesignTokens.spaceXL),
          
          // Profile Options
          _buildProfileOption(
            context,
            icon: Icons.edit_outlined,
            title: 'Modifier le profil',
            onTap: () => context.go(RouteNames.editProfile),
          ),
          
          _buildProfileOption(
            context,
            icon: Icons.history,
            title: 'Historique des commandes',
            onTap: () => context.go(RouteNames.orderHistory),
          ),
          
          _buildProfileOption(
            context,
            icon: Icons.settings_outlined,
            title: 'Paramètres',
            onTap: () => context.go(RouteNames.settings),
          ),
          
          _buildProfileOption(
            context,
            icon: Icons.help_outline,
            title: 'Aide et support',
            onTap: () => context.go(RouteNames.contactUs),
          ),
          
          _buildProfileOption(
            context,
            icon: Icons.info_outline,
            title: 'À propos',
            onTap: () => context.go(RouteNames.aboutUs),
          ),
          
          const SizedBox(height: DesignTokens.spaceXL),
          
          // Logout Button
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () => _showLogoutDialog(context),
              icon: const Icon(
                Icons.logout,
                color: DesignTokens.errorColor,
              ),
              label: const Text(
                'Se déconnecter',
                style: TextStyle(
                  color: DesignTokens.errorColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileOption(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.only(bottom: DesignTokens.spaceSM),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Déconnexion'),
        content: const Text('Êtes-vous sûr de vouloir vous déconnecter ?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              context.go(RouteNames.login);
            },
            child: const Text(
              'Se déconnecter',
              style: TextStyle(color: DesignTokens.errorColor),
            ),
          ),
        ],
      ),
    );
  }
}
