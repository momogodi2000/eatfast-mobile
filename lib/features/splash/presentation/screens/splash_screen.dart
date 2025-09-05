import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/router/route_names.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/design_tokens.dart';
import '../../providers/splash_provider.dart';

/// Splash Screen with animated logo and branding
/// Shows company logo with animations and tagline
class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _logoAnimationController;
  late AnimationController _textAnimationController;
  late AnimationController _backgroundAnimationController;

  late Animation<double> _logoScaleAnimation;
  late Animation<double> _logoOpacityAnimation;
  late Animation<double> _textOpacityAnimation;
  late Animation<Alignment> _backgroundGradientAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _startAnimationSequence();
    _navigateToNextScreen();
  }

  void _initializeAnimations() {
    // Logo animation controller
    _logoAnimationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    // Text animation controller
    _textAnimationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    // Background animation controller
    _backgroundAnimationController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    // Logo scale animation (bounce effect: 0.5x -> 1.2x -> 1.0x)
    _logoScaleAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.5, end: 1.2)
            .chain(CurveTween(curve: Curves.easeOut)),
        weight: 70.0,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.2, end: 1.0)
            .chain(CurveTween(curve: Curves.elasticOut)),
        weight: 30.0,
      ),
    ]).animate(_logoAnimationController);

    // Logo opacity animation
    _logoOpacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _logoAnimationController,
      curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
    ));

    // Text opacity animation (delayed)
    _textOpacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _textAnimationController,
      curve: Curves.easeIn,
    ));

    // Background gradient animation
    _backgroundGradientAnimation = Tween<Alignment>(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ).animate(CurvedAnimation(
      parent: _backgroundAnimationController,
      curve: Curves.linear,
    ));
  }

  void _startAnimationSequence() {
    // Start background animation immediately
    _backgroundAnimationController.forward();
    
    // Start logo animation after a small delay
    Future.delayed(const Duration(milliseconds: 300), () {
      _logoAnimationController.forward();
    });

    // Start text animation after logo animation completes
    _logoAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _textAnimationController.forward();
      }
    });
  }

  void _navigateToNextScreen() {
    Future.delayed(const Duration(milliseconds: AppConstants.splashDuration), () {
      if (mounted) {
        ref.read(splashProvider.notifier).checkFirstTimeUser().then((isFirstTime) {
          if (mounted) {
            if (isFirstTime) {
              context.go(RouteNames.terms);
            } else {
              context.go(RouteNames.home);
            }
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _logoAnimationController.dispose();
    _textAnimationController.dispose();
    _backgroundAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    
    return Scaffold(
      body: AnimatedBuilder(
        animation: Listenable.merge([
          _logoAnimationController,
          _textAnimationController,
          _backgroundAnimationController,
        ]),
        builder: (context, child) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: _backgroundGradientAnimation.value,
                end: Alignment.bottomRight,
                colors: [
                  DesignTokens.primaryColor.withValues(alpha: 0.8),
                  DesignTokens.secondaryColor.withValues(alpha: 0.6),
                  DesignTokens.accentColor.withValues(alpha: 0.4),
                ],
                stops: const [0.0, 0.6, 1.0],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Animated Logo Section
                Transform.scale(
                  scale: _logoScaleAnimation.value,
                  child: Opacity(
                    opacity: _logoOpacityAnimation.value,
                    child: Container(
                      width: screenSize.width * 0.4,
                      height: screenSize.width * 0.4,
                      decoration: BoxDecoration(
                        color: DesignTokens.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: DesignTokens.black.withValues(alpha: 0.2),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Image.asset(
                          AppConstants.logoAsset,
                          width: screenSize.width * 0.25,
                          height: screenSize.width * 0.25,
                          errorBuilder: (context, error, stackTrace) {
                            // Fallback if logo asset is not available
                            return Icon(
                              Icons.restaurant,
                              size: screenSize.width * 0.15,
                              color: DesignTokens.primaryColor,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                
                const SizedBox(height: DesignTokens.spaceXL),
                
                // Animated App Name
                Opacity(
                  opacity: _textOpacityAnimation.value,
                  child: Column(
                    children: [
                      // App Name with typewriter effect simulation
                      TweenAnimationBuilder<int>(
                        duration: const Duration(milliseconds: 800),
                        tween: IntTween(
                          begin: 0,
                          end: _textAnimationController.isCompleted 
                              ? AppConstants.appName.length 
                              : 0,
                        ),
                        builder: (context, value, child) {
                          return Text(
                            AppConstants.appName.substring(0, value),
                            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                              color: DesignTokens.white,
                              fontWeight: DesignTokens.fontWeightBold,
                              letterSpacing: 2.0,
                              shadows: [
                                Shadow(
                                  color: DesignTokens.black.withValues(alpha: 0.3),
                                  blurRadius: 10,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      
                      const SizedBox(height: DesignTokens.spaceMD),
                      
                      // App Tagline
                      Text(
                        AppConstants.appTagline,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: DesignTokens.white.withValues(alpha: 0.9),
                          fontWeight: DesignTokens.fontWeightMedium,
                          fontStyle: FontStyle.italic,
                          shadows: [
                            Shadow(
                              color: DesignTokens.black.withValues(alpha: 0.3),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: DesignTokens.spaceXXL),
                
                // Loading Indicator
                Opacity(
                  opacity: _textOpacityAnimation.value,
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: CircularProgressIndicator(
                      strokeWidth: 3.0,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        DesignTokens.white.withValues(alpha: 0.8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
