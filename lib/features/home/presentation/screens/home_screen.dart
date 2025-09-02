import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/design_tokens.dart';

/// Home Screen - Main application screen
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            onPressed: () => context.go(RouteNames.profile),
          ),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          _HomeContent(),
          _RestaurantsContent(),
          _OrdersContent(),
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

class _HomeContent extends StatelessWidget {
  const _HomeContent();

  @override
  Widget build(BuildContext context) {
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
              decoration: InputDecoration(
                hintText: 'Rechercher des plats, restaurants...',
                prefixIcon: const Icon(Icons.search),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.all(DesignTokens.spaceMD),
              ),
              onTap: () {
                // TODO: Navigate to search
              },
              readOnly: true,
            ),
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
                return Container(
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
                );
              },
            ),
          ),
          
          const SizedBox(height: DesignTokens.spaceXL),
          
          // Popular Dishes
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Plats Populaires',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: DesignTokens.fontWeightBold,
                ),
              ),
              TextButton(
                onPressed: () {
                  // TODO: Navigate to all dishes
                },
                child: const Text('Voir tout'),
              ),
            ],
          ),
          
          const SizedBox(height: DesignTokens.spaceMD),
          
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: DesignTokens.spaceMD,
              mainAxisSpacing: DesignTokens.spaceMD,
              childAspectRatio: 0.8,
            ),
            itemCount: AppConstants.popularDishes.length,
            itemBuilder: (context, index) {
              final dish = AppConstants.popularDishes.entries.toList()[index];
              return _buildDishCard(context, dish.key, dish.value);
            },
          ),
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

  Widget _buildDishCard(BuildContext context, String dishName, String imagePath) {
    return Card(
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: DesignTokens.lightGrey.withOpacity(0.3),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(DesignTokens.radiusMD),
                  topRight: Radius.circular(DesignTokens.radiusMD),
                ),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                  onError: (exception, stackTrace) {
                    // Handle image loading error
                  },
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(DesignTokens.radiusMD),
                    topRight: Radius.circular(DesignTokens.radiusMD),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.1),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(DesignTokens.spaceMD),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dishName,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: DesignTokens.fontWeightSemiBold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: DesignTokens.spaceXS),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: DesignTokens.warningColor,
                      size: 16,
                    ),
                    const SizedBox(width: DesignTokens.spaceXXS),
                    Text(
                      '4.5',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const Spacer(),
                    Text(
                      '2500 FCFA',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: DesignTokens.primaryColor,
                        fontWeight: DesignTokens.fontWeightBold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _RestaurantsContent extends StatelessWidget {
  const _RestaurantsContent();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Restaurants\n(À implémenter en Phase 3)',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}

class _OrdersContent extends StatelessWidget {
  const _OrdersContent();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Historique des commandes\n(À implémenter en Phase 3)',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18),
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
