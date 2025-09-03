import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/router/route_names.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/design_tokens.dart';

/// Welcome Screen - Final screen after onboarding
/// Shows welcome message and navigation to authentication
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  late AnimationController _fadeAnimationController;
  late AnimationController _slideAnimationController;
  late AnimationController _scaleAnimationController;
  
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideFromTopAnimation;
  late Animation<Offset> _slideFromBottomAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _startAnimations();
  }

  void _initializeAnimations() {
    _fadeAnimationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    
    _slideAnimationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    
    _scaleAnimationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeAnimationController,
      curve: Curves.easeIn,
    ));

    _slideFromTopAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideAnimationController,
      curve: Curves.easeOut,
    ));

    _slideFromBottomAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideAnimationController,
      curve: Curves.easeOut,
    ));

    _scaleAnimation = Tween<double>(
      begin: 0.5,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _scaleAnimationController,
      curve: Curves.elasticOut,
    ));
  }

  void _startAnimations() {
    _fadeAnimationController.forward();
    
    Future.delayed(const Duration(milliseconds: 300), () {
      _scaleAnimationController.forward();
    });
    
    Future.delayed(const Duration(milliseconds: 500), () {
      _slideAnimationController.forward();
    });
  }

  void _navigateToAuth() {
    context.go(RouteNames.login);
  }

  void _exploreAsGuest() {
    context.go(RouteNames.home);
  }

  @override
  void dispose() {
    _fadeAnimationController.dispose();
    _slideAnimationController.dispose();
    _scaleAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    
    return Scaffold(
      body: AnimatedBuilder(
        animation: Listenable.merge([
          _fadeAnimationController,
          _slideAnimationController,
          _scaleAnimationController,
        ]),
        builder: (context, child) {
          return Opacity(
            opacity: _fadeAnimation.value,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    DesignTokens.primaryColor.withOpacity(0.1),
                    DesignTokens.white,
                    DesignTokens.secondaryColor.withOpacity(0.1),
                  ],
                  stops: const [0.0, 0.5, 1.0],
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(DesignTokens.spaceLG),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Top Section - Logo and Welcome
                      SlideTransition(
                        position: _slideFromTopAnimation,
                        child: Column(
                          children: [
                            // App Logo
                            ScaleTransition(
                              scale: _scaleAnimation,
                              child: Container(
                                width: screenWidth * 0.3,
                                height: screenWidth * 0.3,
                                decoration: BoxDecoration(
                                  color: DesignTokens.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: DesignTokens.primaryColor.withOpacity(0.3),
                                      blurRadius: 20,
                                      spreadRadius: 5,
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Image.asset(
                                    AppConstants.logoAsset,
                                    width: screenWidth * 0.2,
                                    height: screenWidth * 0.2,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Icon(
                                        Icons.restaurant,
                                        size: screenWidth * 0.15,
                                        color: DesignTokens.primaryColor,
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                            
                            const SizedBox(height: DesignTokens.spaceXL),
                            
                            // Welcome Text
                            Text(
                              'Félicitations! 🎉',
                              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                fontWeight: DesignTokens.fontWeightBold,
                                color: DesignTokens.primaryColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            
                            const SizedBox(height: DesignTokens.spaceMD),
                            
                            Text(
                              'Vous êtes maintenant prêt à découvrir les délicieux plats du Cameroun!',
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                color: DesignTokens.textSecondary,
                                height: 1.5,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      
                      SizedBox(height: screenHeight * 0.1),
                      
                      // Features Section
                      SlideTransition(
                        position: _slideFromBottomAnimation,
                        child: Column(
                          children: [
                            Text(
                              'Ce qui vous attend :',
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontWeight: DesignTokens.fontWeightSemiBold,
                                color: DesignTokens.textPrimary,
                              ),
                            ),
                            
                            const SizedBox(height: DesignTokens.spaceLG),
                            
                            // Feature Cards
                            _buildFeatureCard(
                              context,
                              icon: Icons.restaurant_menu,
                              title: 'Plats Authentiques',
                              description: 'Découvrez les spécialités camerounaises',
                              color: DesignTokens.primaryColor,
                            ),
                            
                            const SizedBox(height: DesignTokens.spaceMD),
                            
                            _buildFeatureCard(
                              context,
                              icon: Icons.delivery_dining,
                              title: 'Livraison Rapide',
                              description: 'Recevez vos commandes en 30 minutes',
                              color: DesignTokens.secondaryColor,
                            ),
                            
                            const SizedBox(height: DesignTokens.spaceMD),
                            
                            _buildFeatureCard(
                              context,
                              icon: Icons.payment,
                              title: 'Paiement Facile',
                              description: 'Mobile Money et autres options',
                              color: DesignTokens.accentColor,
                            ),
                          ],
                        ),
                      ),
                      
                      SizedBox(height: screenHeight * 0.08),
                      
                      // Action Buttons
                      SlideTransition(
                        position: _slideFromBottomAnimation,
                        child: Column(
                          children: [
                            // Primary Action - Sign Up/Login
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: _navigateToAuth,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: DesignTokens.primaryColor,
                                  foregroundColor: DesignTokens.white,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: DesignTokens.spaceLG,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Créer mon compte',
                                      style: const TextStyle(
                                        fontSize: DesignTokens.fontSizeLG,
                                        fontWeight: DesignTokens.fontWeightSemiBold,
                                      ),
                                    ),
                                    const SizedBox(width: DesignTokens.spaceXS),
                                    const Icon(Icons.arrow_forward),
                                  ],
                                ),
                              ),
                            ),
                            
                            const SizedBox(height: DesignTokens.spaceMD),
                            
                            // Secondary Action - Explore as Guest
                            SizedBox(
                              width: double.infinity,
                              child: OutlinedButton(
                                onPressed: _exploreAsGuest,
                                child: Text(
                                  'Explorer en tant qu\'invité',
                                  style: const TextStyle(
                                    fontSize: DesignTokens.fontSizeMD,
                                    fontWeight: DesignTokens.fontWeightMedium,
                                  ),
                                ),
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
          );
        },
      ),
    );
  }

  Widget _buildFeatureCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String description,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(DesignTokens.spaceMD),
      decoration: BoxDecoration(
        color: DesignTokens.white,
        borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
        border: Border.all(
          color: color.withOpacity(0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(DesignTokens.spaceSM),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(DesignTokens.radiusSM),
            ),
            child: Icon(
              icon,
              color: color,
              size: DesignTokens.iconLG,
            ),
          ),
          const SizedBox(width: DesignTokens.spaceMD),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: DesignTokens.fontWeightSemiBold,
                    color: color,
                  ),
                ),
                const SizedBox(height: DesignTokens.spaceXS),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: DesignTokens.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
