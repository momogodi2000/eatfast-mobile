import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/design_tokens.dart';
import '../../providers/onboarding_provider.dart';

/// Welcome and Onboarding Screen
/// 3-page onboarding flow with smooth animations
class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen>
    with TickerProviderStateMixin {
  final PageController _pageController = PageController();
  
  late AnimationController _fadeAnimationController;
  late AnimationController _slideAnimationController;
  late AnimationController _scaleAnimationController;
  
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;

  final List<OnboardingPage> _pages = [
    const OnboardingPage(
      title: 'Bienvenue chez EatFast',
      subtitle: 'Découvrez les saveurs authentiques du Cameroun',
      description: 'Votre application de livraison de nourriture préférée vous connecte avec les meilleurs restaurants locaux pour une expérience culinaire exceptionnelle.',
      imagePath: AppConstants.onboardingWelcome,
      animationPath: AppConstants.welcomeAnimation,
      backgroundColor: DesignTokens.primaryColor,
    ),
    const OnboardingPage(
      title: 'Notre Mission',
      subtitle: 'Connecter les Camerounais avec leurs restaurants préférés',
      description: 'Nous facilitons l\'accès à une variété de plats traditionnels et modernes, préparés avec amour par nos partenaires restaurateurs de confiance.',
      imagePath: AppConstants.onboardingMission,
      animationPath: AppConstants.missionAnimation,
      backgroundColor: DesignTokens.secondaryColor,
    ),
    const OnboardingPage(
      title: 'Livraison Rapide',
      subtitle: 'À votre porte en 30 minutes ou moins',
      description: 'Notre réseau de livreurs dévoués assure une livraison rapide et sécurisée de vos repas favoris, où que vous soyez dans la ville.',
      imagePath: AppConstants.onboardingDelivery,
      animationPath: AppConstants.deliveryAnimation,
      backgroundColor: DesignTokens.accentColor,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _startInitialAnimation();
  }

  void _initializeAnimations() {
    _fadeAnimationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    
    _slideAnimationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    
    _scaleAnimationController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeAnimationController,
      curve: Curves.easeIn,
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideAnimationController,
      curve: Curves.easeOut,
    ));

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _scaleAnimationController,
      curve: Curves.elasticOut,
    ));
  }

  void _startInitialAnimation() {
    _fadeAnimationController.forward();
    _slideAnimationController.forward();
    _scaleAnimationController.forward();
  }

  void _onPageChanged(int index) {
    ref.read(onboardingProvider.notifier).setCurrentPage(index);
    
    // Restart animations for new page
    _slideAnimationController.reset();
    _scaleAnimationController.reset();
    
    Future.delayed(const Duration(milliseconds: 100), () {
      _slideAnimationController.forward();
      _scaleAnimationController.forward();
    });
  }

  void _nextPage() {
    final currentPage = ref.read(onboardingProvider).currentPage;
    if (currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _completeOnboarding();
    }
  }

  void _previousPage() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _skipOnboarding() {
    _completeOnboarding();
  }

  void _completeOnboarding() {
    context.go(RouteNames.welcome);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _fadeAnimationController.dispose();
    _slideAnimationController.dispose();
    _scaleAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final onboardingState = ref.watch(onboardingProvider);
    final currentPage = onboardingState.currentPage;
    final isLastPage = currentPage == _pages.length - 1;

    return Scaffold(
      body: AnimatedBuilder(
        animation: _fadeAnimationController,
        builder: (context, child) {
          return Opacity(
            opacity: _fadeAnimation.value,
            child: Stack(
              children: [
                // Page View
                PageView.builder(
                  controller: _pageController,
                  onPageChanged: _onPageChanged,
                  itemCount: _pages.length,
                  itemBuilder: (context, index) {
                    return _buildOnboardingPage(_pages[index]);
                  },
                ),
                
                // Top Action Bar
                Positioned(
                  top: MediaQuery.of(context).padding.top + 16,
                  left: 16,
                  right: 16,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Skip Button
                      TextButton(
                        onPressed: _skipOnboarding,
                        child: Text(
                          AppConstants.skipButton,
                          style: TextStyle(
                            color: DesignTokens.white.withOpacity(0.8),
                            fontSize: DesignTokens.fontSizeMD,
                            fontWeight: DesignTokens.fontWeightMedium,
                          ),
                        ),
                      ),
                      
                      // Page Indicators
                      Row(
                        children: List.generate(
                          _pages.length,
                          (index) => AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            width: index == currentPage ? 24 : 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: index == currentPage
                                  ? DesignTokens.white
                                  : DesignTokens.white.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                
                // Bottom Navigation
                Positioned(
                  bottom: MediaQuery.of(context).padding.bottom + 32,
                  left: 24,
                  right: 24,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Previous Button
                      if (currentPage > 0)
                        TextButton.icon(
                          onPressed: _previousPage,
                          icon: const Icon(Icons.arrow_back),
                          label: Text(AppConstants.previousButton),
                          style: TextButton.styleFrom(
                            foregroundColor: DesignTokens.white.withOpacity(0.8),
                          ),
                        )
                      else
                        const SizedBox.shrink(),
                      
                      // Next/Get Started Button
                      ElevatedButton.icon(
                        onPressed: _nextPage,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: DesignTokens.white,
                          foregroundColor: _pages[currentPage].backgroundColor,
                          padding: const EdgeInsets.symmetric(
                            horizontal: DesignTokens.spaceLG,
                            vertical: DesignTokens.spaceMD,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(DesignTokens.radiusXL),
                          ),
                        ),
                        icon: Icon(isLastPage ? Icons.check : Icons.arrow_forward),
                        label: Text(
                          isLastPage ? AppConstants.getStartedButton : AppConstants.nextButton,
                          style: const TextStyle(
                            fontWeight: DesignTokens.fontWeightSemiBold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildOnboardingPage(OnboardingPage page) {
    return AnimatedBuilder(
      animation: Listenable.merge([_slideAnimationController, _scaleAnimationController]),
      builder: (context, child) {
        return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                page.backgroundColor,
                page.backgroundColor.withOpacity(0.8),
              ],
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(DesignTokens.spaceLG),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: DesignTokens.spaceXXL),
                  
                  // Image/Animation Section
                  SlideTransition(
                    position: _slideAnimation,
                    child: ScaleTransition(
                      scale: _scaleAnimation,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: MediaQuery.of(context).size.width * 0.6,
                        decoration: BoxDecoration(
                          color: DesignTokens.white.withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.width * 0.4,
                            decoration: const BoxDecoration(
                              color: DesignTokens.white,
                              shape: BoxShape.circle,
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                page.imagePath,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Icon(
                                    _getIconForPage(page.title),
                                    size: MediaQuery.of(context).size.width * 0.2,
                                    color: page.backgroundColor,
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: DesignTokens.spaceXXL),
                  
                  // Text Content
                  SlideTransition(
                    position: _slideAnimation,
                    child: Column(
                      children: [
                        // Title
                        Text(
                          page.title,
                          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                            color: DesignTokens.white,
                            fontWeight: DesignTokens.fontWeightBold,
                            height: 1.2,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        
                        const SizedBox(height: DesignTokens.spaceMD),
                        
                        // Subtitle
                        Text(
                          page.subtitle,
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: DesignTokens.white.withOpacity(0.9),
                            fontWeight: DesignTokens.fontWeightMedium,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        
                        const SizedBox(height: DesignTokens.spaceLG),
                        
                        // Description
                        Text(
                          page.description,
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: DesignTokens.white.withOpacity(0.8),
                            height: 1.6,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: DesignTokens.spaceXXL),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  IconData _getIconForPage(String title) {
    if (title.contains('Bienvenue')) {
      return Icons.restaurant_menu;
    } else if (title.contains('Mission')) {
      return Icons.location_on;
    } else if (title.contains('Livraison')) {
      return Icons.delivery_dining;
    }
    return Icons.fastfood;
  }
}

/// Onboarding page data model
class OnboardingPage {
  final String title;
  final String subtitle;
  final String description;
  final String imagePath;
  final String animationPath;
  final Color backgroundColor;

  const OnboardingPage({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.imagePath,
    required this.animationPath,
    required this.backgroundColor,
  });
}
