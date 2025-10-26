import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:geolocator/geolocator.dart';
import 'package:eatfast_mobile/shared/config/router/route_names.dart';
import 'package:eatfast_mobile/shared/constants/app_constants.dart';
import 'package:eatfast_mobile/shared/themes/design_tokens.dart';
import '../widgets/widgets/guest_feature_cards.dart';
import 'package:eatfast_mobile/modules/guest_module/providers/guest_session_provider.dart';

/// Enhanced Guest Landing Screen - Beautifully redesigned with modern UI/UX
/// Features: Hero sections, animations, interactive cards, better location handling
class GuestLandingScreen extends ConsumerStatefulWidget {
  const GuestLandingScreen({super.key});

  @override
  ConsumerState<GuestLandingScreen> createState() => _GuestLandingScreenState();
}

class _GuestLandingScreenState extends ConsumerState<GuestLandingScreen>
    with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  // Position? _currentLocation; // Removed unused field
  bool _isLoadingLocation = false;
  String _locationText = 'Localisation non disponible';

  late AnimationController _heroAnimationController;
  late AnimationController _cardAnimationController;
  late Animation<double> _heroFadeAnimation;
  late Animation<Offset> _heroSlideAnimation;
  late Animation<double> _cardStaggerAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _initializeGuestSession();
    _getCurrentLocation();
  }

  void _initializeAnimations() {
    _heroAnimationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _cardAnimationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _heroFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _heroAnimationController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
      ),
    );

    _heroSlideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _heroAnimationController,
            curve: const Interval(0.2, 0.8, curve: Curves.easeOutCubic),
          ),
        );

    _cardStaggerAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _cardAnimationController, curve: Curves.easeOut),
    );

    _heroAnimationController.forward();
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) {
        _cardAnimationController.forward();
      }
    });
  }

  Future<void> _initializeGuestSession() async {
    try {
      await ref.read(guestSessionProvider.notifier).ensureSession();
    } catch (e) {
      debugPrint('Failed to initialize guest session: $e');
    }
  }

  Future<void> _getCurrentLocation() async {
    setState(() {
      _isLoadingLocation = true;
    });

    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        setState(() {
          _locationText = 'Services de localisation désactivés';
          _isLoadingLocation = false;
        });
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          setState(() {
            _locationText = 'Permission de localisation refusée';
            _isLoadingLocation = false;
          });
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        setState(() {
          _locationText = 'Permission de localisation refusée définitivement';
          _isLoadingLocation = false;
        });
        return;
      }

      await Geolocator.getCurrentPosition();
      setState(() {
        _locationText =
            'Yaoundé, Cameroun'; // You can geocode the position later
      });
    } catch (e) {
      setState(() {
        _locationText = 'Erreur de localisation';
      });
      debugPrint('Error getting location: $e');
    } finally {
      setState(() {
        _isLoadingLocation = false;
      });
    }
  }

  void _navigateToRestaurants() {
    context.go(RouteNames.guestRestaurants);
  }

  void _navigateToAuth() {
    context.go(RouteNames.login);
  }

  void _navigateToRegister() {
    context.go(RouteNames.register);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _heroAnimationController.dispose();
    _cardAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: DesignTokens.backgroundLight,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          // Hero Section with Gradient
          SliverToBoxAdapter(
            child: AnimatedBuilder(
              animation: _heroAnimationController,
              builder: (context, child) {
                return FadeTransition(
                  opacity: _heroFadeAnimation,
                  child: SlideTransition(
                    position: _heroSlideAnimation,
                    child: Container(
                      height: size.height * 0.45,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            DesignTokens.primaryColor,
                            DesignTokens.primaryColor.withValues(alpha: 0.8),
                            DesignTokens.secondaryColor.withValues(alpha: 0.6),
                          ],
                        ),
                      ),
                      child: SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.all(DesignTokens.spaceLG),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Top Bar with Login Button
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // Logo
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: DesignTokens.spaceMD,
                                      vertical: DesignTokens.spaceSM,
                                    ),
                                    decoration: BoxDecoration(
                                      color: DesignTokens.white.withValues(
                                        alpha: 0.2,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        DesignTokens.radiusMD,
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.restaurant,
                                          color: DesignTokens.white,
                                          size: DesignTokens.iconMD,
                                        ),
                                        const SizedBox(
                                          width: DesignTokens.spaceXS,
                                        ),
                                        Text(
                                          AppConstants.appName,
                                          style: const TextStyle(
                                            color: DesignTokens.white,
                                            fontSize: DesignTokens.fontSizeLG,
                                            fontWeight:
                                                DesignTokens.fontWeightBold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Login Button
                                  ElevatedButton(
                                    onPressed: _navigateToAuth,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: DesignTokens.white,
                                      foregroundColor:
                                          DesignTokens.primaryColor,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: DesignTokens.spaceLG,
                                        vertical: DesignTokens.spaceMD,
                                      ),
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          DesignTokens.radiusMD,
                                        ),
                                      ),
                                    ),
                                    child: const Text(
                                      'Se connecter',
                                      style: TextStyle(
                                        fontWeight: DesignTokens.fontWeightBold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              const Spacer(),

                              // Hero Text
                              Text(
                                'Bienvenue chez',
                                style: TextStyle(
                                  color: DesignTokens.white.withValues(
                                    alpha: 0.9,
                                  ),
                                  fontSize: DesignTokens.fontSizeMD,
                                  fontWeight: DesignTokens.fontWeightMedium,
                                ),
                              ),
                              const SizedBox(height: DesignTokens.spaceXS),
                              Text(
                                AppConstants.appName,
                                style: const TextStyle(
                                  color: DesignTokens.white,
                                  fontSize: DesignTokens.fontSizeXXL,
                                  fontWeight: DesignTokens.fontWeightBold,
                                  height: 1.2,
                                ),
                              ),
                              const SizedBox(height: DesignTokens.spaceMD),
                              Text(
                                'Découvrez les saveurs authentiques\ndu Cameroun à portée de main',
                                style: TextStyle(
                                  color: DesignTokens.white.withValues(
                                    alpha: 0.95,
                                  ),
                                  fontSize: DesignTokens.fontSizeMD,
                                  height: 1.5,
                                ),
                              ),
                              const SizedBox(height: DesignTokens.spaceXL),

                              // Location Display
                              Container(
                                padding: const EdgeInsets.all(
                                  DesignTokens.spaceMD,
                                ),
                                decoration: BoxDecoration(
                                  color: DesignTokens.white.withValues(
                                    alpha: 0.2,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    DesignTokens.radiusMD,
                                  ),
                                  border: Border.all(
                                    color: DesignTokens.white.withValues(
                                      alpha: 0.3,
                                    ),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: DesignTokens.white,
                                      size: DesignTokens.iconMD,
                                    ),
                                    const SizedBox(width: DesignTokens.spaceSM),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Votre position',
                                            style: TextStyle(
                                              color: DesignTokens.white
                                                  .withValues(alpha: 0.9),
                                              fontSize: DesignTokens.fontSizeSM,
                                              fontWeight:
                                                  DesignTokens.fontWeightMedium,
                                            ),
                                          ),
                                          Text(
                                            _isLoadingLocation
                                                ? 'Recherche...'
                                                : _locationText,
                                            style: const TextStyle(
                                              color: DesignTokens.white,
                                              fontSize: DesignTokens.fontSizeMD,
                                              fontWeight:
                                                  DesignTokens.fontWeightBold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (_isLoadingLocation)
                                      const SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                DesignTokens.white,
                                              ),
                                        ),
                                      )
                                    else
                                      IconButton(
                                        onPressed: _getCurrentLocation,
                                        icon: const Icon(
                                          Icons.refresh,
                                          color: DesignTokens.white,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Main Content
          SliverToBoxAdapter(
            child: Transform.translate(
              offset: const Offset(0, -30),
              child: AnimatedBuilder(
                animation: _cardAnimationController,
                builder: (context, child) {
                  return Opacity(
                    opacity: _cardStaggerAnimation.value,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: DesignTokens.spaceMD,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Primary CTA - Discover Restaurants
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(DesignTokens.spaceLG),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  DesignTokens.accentColor,
                                  DesignTokens.accentColor.withValues(
                                    alpha: 0.8,
                                  ),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(
                                DesignTokens.radiusLG,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: DesignTokens.accentColor.withValues(
                                    alpha: 0.3,
                                  ),
                                  blurRadius: 20,
                                  offset: const Offset(0, 10),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.restaurant_menu,
                                  color: DesignTokens.white,
                                  size: 48,
                                ),
                                const SizedBox(height: DesignTokens.spaceMD),
                                const Text(
                                  'Découvrir les Restaurants',
                                  style: TextStyle(
                                    color: DesignTokens.white,
                                    fontSize: DesignTokens.fontSizeXL,
                                    fontWeight: DesignTokens.fontWeightBold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: DesignTokens.spaceSM),
                                Text(
                                  'Explorez des centaines de restaurants à Yaoundé, Douala et partout au Cameroun',
                                  style: TextStyle(
                                    color: DesignTokens.white.withValues(
                                      alpha: 0.95,
                                    ),
                                    fontSize: DesignTokens.fontSizeMD,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: DesignTokens.spaceLG),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: _navigateToRestaurants,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: DesignTokens.white,
                                      foregroundColor: DesignTokens.accentColor,
                                      padding: const EdgeInsets.symmetric(
                                        vertical: DesignTokens.spaceMD,
                                      ),
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          DesignTokens.radiusMD,
                                        ),
                                      ),
                                    ),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Explorer maintenant',
                                          style: TextStyle(
                                            fontSize: DesignTokens.fontSizeMD,
                                            fontWeight:
                                                DesignTokens.fontWeightBold,
                                          ),
                                        ),
                                        SizedBox(width: DesignTokens.spaceXS),
                                        Icon(Icons.arrow_forward),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: DesignTokens.spaceXL),

                          // Feature Cards Section
                          Text(
                            'Pourquoi choisir ${AppConstants.appName} ?',
                            style: Theme.of(context).textTheme.headlineSmall
                                ?.copyWith(
                                  fontWeight: DesignTokens.fontWeightBold,
                                  color: DesignTokens.textPrimary,
                                ),
                          ),
                          const SizedBox(height: DesignTokens.spaceMD),
                          const GuestFeatureCards(),

                          const SizedBox(height: DesignTokens.spaceXL),

                          // How It Works Section
                          _buildHowItWorksSection(context),

                          const SizedBox(height: DesignTokens.spaceXL),

                          // Statistics Section
                          _buildStatsSection(context),

                          const SizedBox(height: DesignTokens.spaceXL),

                          // CTA Section - Create Account
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(DesignTokens.spaceXL),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  DesignTokens.primaryColor,
                                  DesignTokens.secondaryColor,
                                ],
                              ),
                              borderRadius: BorderRadius.circular(
                                DesignTokens.radiusLG,
                              ),
                            ),
                            child: Column(
                              children: [
                                const Icon(
                                  Icons.person_add,
                                  color: DesignTokens.white,
                                  size: 48,
                                ),
                                const SizedBox(height: DesignTokens.spaceMD),
                                const Text(
                                  'Créez votre compte gratuitement',
                                  style: TextStyle(
                                    color: DesignTokens.white,
                                    fontSize: DesignTokens.fontSizeXL,
                                    fontWeight: DesignTokens.fontWeightBold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: DesignTokens.spaceSM),
                                Text(
                                  'Profitez de promotions exclusives, suivez vos commandes et bien plus encore',
                                  style: TextStyle(
                                    color: DesignTokens.white.withValues(
                                      alpha: 0.95,
                                    ),
                                    fontSize: DesignTokens.fontSizeMD,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: DesignTokens.spaceLG),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: _navigateToRegister,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: DesignTokens.white,
                                      foregroundColor:
                                          DesignTokens.primaryColor,
                                      padding: const EdgeInsets.symmetric(
                                        vertical: DesignTokens.spaceMD,
                                      ),
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          DesignTokens.radiusMD,
                                        ),
                                      ),
                                    ),
                                    child: const Text(
                                      'S\'inscrire gratuitement',
                                      style: TextStyle(
                                        fontSize: DesignTokens.fontSizeMD,
                                        fontWeight: DesignTokens.fontWeightBold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: DesignTokens.spaceXL),

                          // Enterprise Links Section
                          Text(
                            'À propos d\'${AppConstants.appName}',
                            style: Theme.of(context).textTheme.headlineSmall
                                ?.copyWith(
                                  fontWeight: DesignTokens.fontWeightBold,
                                  color: DesignTokens.textPrimary,
                                ),
                          ),
                          const SizedBox(height: DesignTokens.spaceMD),

                          Row(
                            children: [
                              Expanded(
                                child: _buildInfoCard(
                                  context,
                                  icon: Icons.info_outline,
                                  title: 'Notre Histoire',
                                  description: 'Découvrez notre mission',
                                  onTap: () => context.go(RouteNames.aboutUs),
                                ),
                              ),
                              const SizedBox(width: DesignTokens.spaceMD),
                              Expanded(
                                child: _buildInfoCard(
                                  context,
                                  icon: Icons.contact_mail,
                                  title: 'Nous Contacter',
                                  description: 'Besoin d\'aide ?',
                                  onTap: () => context.go(RouteNames.contactUs),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: DesignTokens.spaceXXL),

                          // Footer
                          _buildFooter(context),

                          const SizedBox(height: DesignTokens.spaceXXL),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHowItWorksSection(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(DesignTokens.spaceLG),
      decoration: BoxDecoration(
        color: DesignTokens.white,
        borderRadius: BorderRadius.circular(DesignTokens.radiusLG),
        boxShadow: [
          BoxShadow(
            color: DesignTokens.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Comment ça marche ?',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: DesignTokens.fontWeightBold,
              color: DesignTokens.textPrimary,
            ),
          ),
          const SizedBox(height: DesignTokens.spaceLG),
          _buildStepItem(
            context,
            step: '1',
            icon: Icons.search,
            title: 'Recherchez',
            description: 'Parcourez des centaines de restaurants à proximité',
            color: DesignTokens.primaryColor,
          ),
          const SizedBox(height: DesignTokens.spaceMD),
          _buildStepItem(
            context,
            step: '2',
            icon: Icons.shopping_cart,
            title: 'Commandez',
            description:
                'Choisissez vos plats préférés et validez votre commande',
            color: DesignTokens.accentColor,
          ),
          const SizedBox(height: DesignTokens.spaceMD),
          _buildStepItem(
            context,
            step: '3',
            icon: Icons.delivery_dining,
            title: 'Recevez',
            description:
                'Livraison rapide à votre porte en moins de 30 minutes',
            color: DesignTokens.secondaryColor,
          ),
        ],
      ),
    );
  }

  Widget _buildStepItem(
    BuildContext context, {
    required String step,
    required IconData icon,
    required String title,
    required String description,
    required Color color,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
          ),
          child: Center(
            child: Icon(icon, color: color, size: DesignTokens.iconMD),
          ),
        ),
        const SizedBox(width: DesignTokens.spaceMD),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        step,
                        style: const TextStyle(
                          color: DesignTokens.white,
                          fontSize: DesignTokens.fontSizeSM,
                          fontWeight: DesignTokens.fontWeightBold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: DesignTokens.spaceSM),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: DesignTokens.fontWeightBold,
                      color: DesignTokens.textPrimary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: DesignTokens.spaceXS),
              Text(
                description,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: DesignTokens.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatsSection(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            context,
            icon: Icons.restaurant,
            value: '500+',
            label: 'Restaurants',
            color: DesignTokens.primaryColor,
          ),
        ),
        const SizedBox(width: DesignTokens.spaceMD),
        Expanded(
          child: _buildStatCard(
            context,
            icon: Icons.people,
            value: '50K+',
            label: 'Utilisateurs',
            color: DesignTokens.accentColor,
          ),
        ),
        const SizedBox(width: DesignTokens.spaceMD),
        Expanded(
          child: _buildStatCard(
            context,
            icon: Icons.delivery_dining,
            value: '100K+',
            label: 'Livraisons',
            color: DesignTokens.secondaryColor,
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard(
    BuildContext context, {
    required IconData icon,
    required String value,
    required String label,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(DesignTokens.spaceMD),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: DesignTokens.iconLG),
          const SizedBox(height: DesignTokens.spaceSM),
          Text(
            value,
            style: TextStyle(
              color: color,
              fontSize: DesignTokens.fontSizeXL,
              fontWeight: DesignTokens.fontWeightBold,
            ),
          ),
          const SizedBox(height: DesignTokens.spaceXS),
          Text(
            label,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: DesignTokens.textSecondary),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String description,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(DesignTokens.spaceMD),
        decoration: BoxDecoration(
          color: DesignTokens.white,
          borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
          border: Border.all(
            color: DesignTokens.primaryColor.withValues(alpha: 0.2),
          ),
          boxShadow: [
            BoxShadow(
              color: DesignTokens.black.withValues(alpha: 0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: DesignTokens.primaryColor,
              size: DesignTokens.iconLG,
            ),
            const SizedBox(height: DesignTokens.spaceSM),
            Text(
              title,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: DesignTokens.fontWeightBold,
                color: DesignTokens.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: DesignTokens.spaceXS),
            Text(
              description,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: DesignTokens.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(DesignTokens.spaceLG),
      decoration: BoxDecoration(
        color: DesignTokens.surfaceColor,
        borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
      ),
      child: Column(
        children: [
          Text(
            '© 2025 ${AppConstants.companyName}',
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: DesignTokens.textSecondary),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: DesignTokens.spaceXS),
          Text(
            'Tous droits réservés',
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: DesignTokens.textTertiary),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: DesignTokens.spaceMD),
          Wrap(
            spacing: DesignTokens.spaceMD,
            runSpacing: DesignTokens.spaceSM,
            alignment: WrapAlignment.center,
            children: [
              TextButton(
                onPressed: () => context.go(RouteNames.privacyPolicy),
                child: const Text('Politique de confidentialité'),
              ),
              TextButton(
                onPressed: () => context.go(RouteNames.termsAndConditions),
                child: const Text('Conditions d\'utilisation'),
              ),
              TextButton(
                onPressed: () => context.go(RouteNames.support),
                child: const Text('Support'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
