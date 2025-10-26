import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:eatfast_mobile/shared/config/router/route_names.dart';
import 'package:eatfast_mobile/shared/constants/app_constants.dart';
import 'package:eatfast_mobile/shared/themes/design_tokens.dart';
import '../widgets/terms_content.dart';

/// Terms and Conditions Screen
/// Interactive screen with scrollable terms and acceptance checkbox
class TermsConditionsScreen extends StatefulWidget {
  const TermsConditionsScreen({super.key});

  @override
  State<TermsConditionsScreen> createState() => _TermsConditionsScreenState();
}

class _TermsConditionsScreenState extends State<TermsConditionsScreen>
    with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();

  bool _isAccepted = false;
  bool _hasReadToBottom = false;
  double _scrollProgress = 0.0;

  late AnimationController _headerAnimationController;
  late AnimationController _checkboxAnimationController;
  late AnimationController _buttonAnimationController;

  late Animation<double> _headerFadeAnimation;
  late Animation<double> _headerSlideAnimation;
  late Animation<double> _checkboxScaleAnimation;
  late Animation<double> _buttonSlideAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _setupScrollListener();
  }

  void _initializeAnimations() {
    _headerAnimationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _checkboxAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _buttonAnimationController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _headerFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _headerAnimationController, curve: Curves.easeIn),
    );

    _headerSlideAnimation = Tween<double>(begin: -50.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _headerAnimationController,
        curve: Curves.easeOut,
      ),
    );

    _checkboxScaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _checkboxAnimationController,
        curve: Curves.elasticOut,
      ),
    );

    _buttonSlideAnimation = Tween<double>(begin: 100.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _buttonAnimationController,
        curve: Curves.easeOut,
      ),
    );

    // Start header animation
    _headerAnimationController.forward();
  }

  void _setupScrollListener() {
    _scrollController.addListener(() {
      final maxScroll = _scrollController.position.maxScrollExtent;
      final currentScroll = _scrollController.position.pixels;

      setState(() {
        _scrollProgress = (currentScroll / maxScroll).clamp(0.0, 1.0);

        // Check if user has scrolled to near bottom (90% or more)
        if (_scrollProgress >= 0.9 && !_hasReadToBottom) {
          _hasReadToBottom = true;
          _buttonAnimationController.forward();
        }
      });
    });
  }

  void _onAcceptanceChanged(bool? value) {
    setState(() {
      _isAccepted = value ?? false;
    });

    if (_isAccepted) {
      _checkboxAnimationController.forward();
    } else {
      _checkboxAnimationController.reverse();
    }
  }

  void _onContinuePressed() {
    if (_isAccepted && _hasReadToBottom) {
      context.go(RouteNames.onboarding);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _headerAnimationController.dispose();
    _checkboxAnimationController.dispose();
    _buttonAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DesignTokens.backgroundPrimary,
      appBar: AppBar(
        title: const Text(AppConstants.termsTitle),
        backgroundColor: DesignTokens.primaryColor,
        foregroundColor: DesignTokens.white,
        elevation: DesignTokens.elevation2,
      ),
      body: Column(
        children: [
          // Animated Header Section
          AnimatedBuilder(
            animation: _headerAnimationController,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, _headerSlideAnimation.value),
                child: Opacity(
                  opacity: _headerFadeAnimation.value,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(DesignTokens.spaceLG),
                    decoration: BoxDecoration(
                      color: DesignTokens.primaryColor.withValues(alpha: 0.1),
                      border: Border(
                        bottom: BorderSide(
                          color: DesignTokens.primaryColor.withValues(
                            alpha: 0.3,
                          ),
                          width: 1,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(DesignTokens.spaceMD),
                          decoration: const BoxDecoration(
                            color: DesignTokens.primaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.description_outlined,
                            color: DesignTokens.white,
                            size: DesignTokens.iconLG,
                          ),
                        ),
                        const SizedBox(width: DesignTokens.spaceMD),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Conditions d\'utilisation',
                                style: Theme.of(context).textTheme.titleLarge
                                    ?.copyWith(
                                      fontWeight:
                                          DesignTokens.fontWeightSemiBold,
                                    ),
                              ),
                              const SizedBox(height: DesignTokens.spaceXS),
                              Text(
                                'Veuillez lire attentivement nos conditions',
                                style: Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(
                                      color: DesignTokens.textSecondary,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),

          // Scroll Progress Indicator
          LinearProgressIndicator(
            value: _scrollProgress,
            backgroundColor: DesignTokens.lightGrey,
            valueColor: AlwaysStoppedAnimation<Color>(
              _hasReadToBottom
                  ? DesignTokens.successColor
                  : DesignTokens.primaryColor,
            ),
            minHeight: 3,
          ),

          // Terms Content
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              padding: const EdgeInsets.all(DesignTokens.spaceLG),
              child: const TermsContent(),
            ),
          ),

          // Bottom Action Section
          AnimatedBuilder(
            animation: _buttonAnimationController,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, _buttonSlideAnimation.value),
                child: Container(
                  padding: const EdgeInsets.all(DesignTokens.spaceLG),
                  decoration: BoxDecoration(
                    color: DesignTokens.white,
                    border: const Border(
                      top: BorderSide(color: DesignTokens.lightGrey, width: 1),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: DesignTokens.black.withValues(alpha: 0.1),
                        blurRadius: 10,
                        offset: const Offset(0, -2),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Read to bottom indicator
                      if (!_hasReadToBottom)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: DesignTokens.spaceMD,
                            vertical: DesignTokens.spaceXS,
                          ),
                          decoration: BoxDecoration(
                            color: DesignTokens.warningColor.withValues(
                              alpha: 0.1,
                            ),
                            borderRadius: BorderRadius.circular(
                              DesignTokens.radiusSM,
                            ),
                            border: Border.all(
                              color: DesignTokens.warningColor.withValues(
                                alpha: 0.3,
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.arrow_downward,
                                size: DesignTokens.iconSM,
                                color: DesignTokens.warningColor,
                              ),
                              const SizedBox(width: DesignTokens.spaceXS),
                              Text(
                                'Faites défiler jusqu\'au bas pour continuer',
                                style: Theme.of(context).textTheme.bodySmall
                                    ?.copyWith(
                                      color: DesignTokens.warningColor,
                                    ),
                              ),
                            ],
                          ),
                        ),

                      if (!_hasReadToBottom)
                        const SizedBox(height: DesignTokens.spaceMD),

                      // Acceptance Checkbox
                      AnimatedBuilder(
                        animation: _checkboxAnimationController,
                        builder: (context, child) {
                          return Transform.scale(
                            scale: _checkboxScaleAnimation.value,
                            child: Container(
                              padding: const EdgeInsets.all(
                                DesignTokens.spaceMD,
                              ),
                              decoration: BoxDecoration(
                                color: _hasReadToBottom
                                    ? DesignTokens.successColor.withValues(
                                        alpha: 0.1,
                                      )
                                    : DesignTokens.lightGrey.withValues(
                                        alpha: 0.5,
                                      ),
                                borderRadius: BorderRadius.circular(
                                  DesignTokens.radiusMD,
                                ),
                                border: Border.all(
                                  color: _hasReadToBottom
                                      ? DesignTokens.successColor.withValues(
                                          alpha: 0.3,
                                        )
                                      : DesignTokens.mediumGrey.withValues(
                                          alpha: 0.3,
                                        ),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Checkbox(
                                    value: _isAccepted,
                                    onChanged: _hasReadToBottom
                                        ? _onAcceptanceChanged
                                        : null,
                                    activeColor: DesignTokens.primaryColor,
                                    checkColor: DesignTokens.white,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'J\'ai lu et j\'accepte les conditions générales d\'utilisation',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            fontWeight:
                                                DesignTokens.fontWeightMedium,
                                            color: _hasReadToBottom
                                                ? DesignTokens.textPrimary
                                                : DesignTokens.textTertiary,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: DesignTokens.spaceLG),

                      // Continue Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: (_isAccepted && _hasReadToBottom)
                              ? _onContinuePressed
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: (_isAccepted && _hasReadToBottom)
                                ? DesignTokens.primaryColor
                                : DesignTokens.mediumGrey,
                            foregroundColor: DesignTokens.white,
                            padding: const EdgeInsets.symmetric(
                              vertical: DesignTokens.spaceMD,
                            ),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                AppConstants.continueButton,
                                style: TextStyle(
                                  fontSize: DesignTokens.fontSizeMD,
                                  fontWeight: DesignTokens.fontWeightSemiBold,
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
              );
            },
          ),
        ],
      ),
    );
  }
}
