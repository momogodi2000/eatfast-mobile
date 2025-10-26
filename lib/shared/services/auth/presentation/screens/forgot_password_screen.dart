import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:eatfast_mobile/shared/config/router/route_names.dart';
import 'package:eatfast_mobile/shared/themes/design_tokens.dart';
import 'package:eatfast_mobile/shared/services/auth/providers/unified_auth_provider.dart';

/// Forgot Password Screen - Redesigned and Responsive
class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  ConsumerState<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  bool _isLoading = false;
  bool _emailSent = false;

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
  }

  void _initializeAnimations() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
          CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
        );

    _animationController.forward();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _onResetPressed() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isLoading = true;
      });

      try {
        // Call real API through unified auth provider
        final success = await ref
            .read(authProvider.notifier)
            .forgotPassword(_emailController.text.trim());

        if (!mounted) return;

        setState(() {
          _isLoading = false;
          _emailSent = success;
        });

        if (success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Instructions de réinitialisation envoyées par email',
              ),
              backgroundColor: DesignTokens.successColor,
              behavior: SnackBarBehavior.floating,
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Erreur lors de l\'envoi de l\'email'),
              backgroundColor: DesignTokens.errorColor,
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      } catch (error) {
        if (!mounted) return;

        setState(() {
          _isLoading = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erreur: ${error.toString()}'),
            backgroundColor: DesignTokens.errorColor,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    final isTablet = screenWidth >= 600;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: isTablet
                        ? DesignTokens.spaceXXL
                        : DesignTokens.spaceLG,
                  ),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight:
                          screenHeight -
                          MediaQuery.of(context).padding.top -
                          MediaQuery.of(context).padding.bottom,
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(height: screenHeight * 0.02),

                          // Back Button
                          Align(
                            alignment: Alignment.centerLeft,
                            child: IconButton(
                              icon: const Icon(Icons.arrow_back_ios),
                              onPressed: () => context.pop(),
                              padding: EdgeInsets.zero,
                            ),
                          ),

                          SizedBox(height: screenHeight * 0.02),

                          if (!_emailSent) ...[
                            // Icon
                            Container(
                              width: screenWidth * 0.25,
                              height: screenWidth * 0.25,
                              decoration: BoxDecoration(
                                color: DesignTokens.primaryColor.withValues(
                                  alpha: 0.1,
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.lock_reset,
                                size: screenWidth * 0.12,
                                color: DesignTokens.primaryColor,
                              ),
                            ),

                            SizedBox(height: screenHeight * 0.03),

                            // Header
                            Text(
                              'Mot de passe oublié?',
                              style: Theme.of(context).textTheme.headlineMedium
                                  ?.copyWith(
                                    fontWeight: DesignTokens.fontWeightBold,
                                    fontSize: isTablet ? 32 : 28,
                                  ),
                              textAlign: TextAlign.center,
                            ),

                            SizedBox(height: screenHeight * 0.015),

                            Text(
                              'Pas de soucis! Entrez votre adresse email et nous vous enverrons un lien pour r�initialiser votre mot de passe.',
                              style: Theme.of(context).textTheme.bodyLarge
                                  ?.copyWith(
                                    color: DesignTokens.textSecondary,
                                    fontSize: isTablet ? 18 : 16,
                                    height: 1.5,
                                  ),
                              textAlign: TextAlign.center,
                            ),

                            SizedBox(height: screenHeight * 0.04),

                            // Form
                            Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: _emailController,
                                    decoration: InputDecoration(
                                      labelText: 'Adresse email',
                                      hintText: 'exemple@email.com',
                                      prefixIcon: const Icon(
                                        Icons.email_outlined,
                                      ),
                                      filled: true,
                                      fillColor:
                                          Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? DesignTokens.surfaceColor
                                          : DesignTokens.backgroundSecondary,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          DesignTokens.radiusMD,
                                        ),
                                        borderSide: BorderSide.none,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          DesignTokens.radiusMD,
                                        ),
                                        borderSide: BorderSide(
                                          color: DesignTokens.lightGrey
                                              .withValues(alpha: 0.3),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          DesignTokens.radiusMD,
                                        ),
                                        borderSide: const BorderSide(
                                          color: DesignTokens.primaryColor,
                                          width: 2,
                                        ),
                                      ),
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.done,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Veuillez entrer votre adresse email';
                                      }
                                      if (!RegExp(
                                        r'^[^@]+@[^@]+\.[^@]+',
                                      ).hasMatch(value)) {
                                        return 'Veuillez entrer une adresse email valide';
                                      }
                                      return null;
                                    },
                                    enabled: !_isLoading,
                                    onFieldSubmitted: (_) => _onResetPressed(),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: screenHeight * 0.03),

                            // Reset Button
                            SizedBox(
                              width: double.infinity,
                              height: 56,
                              child: ElevatedButton(
                                onPressed: _isLoading ? null : _onResetPressed,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: DesignTokens.primaryColor,
                                  foregroundColor: DesignTokens.white,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      DesignTokens.radiusMD,
                                    ),
                                  ),
                                ),
                                child: _isLoading
                                    ? const SizedBox(
                                        height: 24,
                                        width: 24,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2.5,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                DesignTokens.white,
                                              ),
                                        ),
                                      )
                                    : Text(
                                        'Envoyer le lien',
                                        style: TextStyle(
                                          fontSize: isTablet ? 18 : 16,
                                          fontWeight:
                                              DesignTokens.fontWeightSemiBold,
                                        ),
                                      ),
                              ),
                            ),
                          ] else ...[
                            // Success State
                            Container(
                              width: screenWidth * 0.25,
                              height: screenWidth * 0.25,
                              decoration: BoxDecoration(
                                color: DesignTokens.successColor.withValues(
                                  alpha: 0.1,
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.check_circle_outline,
                                size: screenWidth * 0.12,
                                color: DesignTokens.successColor,
                              ),
                            ),

                            SizedBox(height: screenHeight * 0.03),

                            Text(
                              'Email envoyé!',
                              style: Theme.of(context).textTheme.headlineMedium
                                  ?.copyWith(
                                    fontWeight: DesignTokens.fontWeightBold,
                                    fontSize: isTablet ? 32 : 28,
                                    color: DesignTokens.successColor,
                                  ),
                              textAlign: TextAlign.center,
                            ),

                            SizedBox(height: screenHeight * 0.015),

                            Text(
                              'Nous avons envoyé les instructions de réinitialisation � ${_emailController.text}',
                              style: Theme.of(context).textTheme.bodyLarge
                                  ?.copyWith(
                                    color: DesignTokens.textSecondary,
                                    fontSize: isTablet ? 18 : 16,
                                    height: 1.5,
                                  ),
                              textAlign: TextAlign.center,
                            ),

                            SizedBox(height: screenHeight * 0.02),

                            Container(
                              padding: const EdgeInsets.all(
                                DesignTokens.spaceMD,
                              ),
                              decoration: BoxDecoration(
                                color: DesignTokens.infoColor.withValues(
                                  alpha: 0.1,
                                ),
                                borderRadius: BorderRadius.circular(
                                  DesignTokens.radiusMD,
                                ),
                                border: Border.all(
                                  color: DesignTokens.infoColor.withValues(
                                    alpha: 0.3,
                                  ),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.info_outline,
                                    color: DesignTokens.infoColor,
                                    size: isTablet ? 24 : 20,
                                  ),
                                  const SizedBox(width: DesignTokens.spaceSM),
                                  Expanded(
                                    child: Text(
                                      'Vérifiez votre boîte de réception et vos spams',
                                      style: TextStyle(
                                        color: DesignTokens.infoColor,
                                        fontSize: isTablet ? 16 : 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: screenHeight * 0.03),

                            // Resend Button
                            SizedBox(
                              width: double.infinity,
                              height: 56,
                              child: OutlinedButton(
                                onPressed: () {
                                  setState(() {
                                    _emailSent = false;
                                  });
                                },
                                style: OutlinedButton.styleFrom(
                                  side: const BorderSide(
                                    color: DesignTokens.primaryColor,
                                    width: 1.5,
                                  ),
                                  foregroundColor: DesignTokens.primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      DesignTokens.radiusMD,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  'Renvoyer l\'email',
                                  style: TextStyle(
                                    fontSize: isTablet ? 18 : 16,
                                    fontWeight: DesignTokens.fontWeightSemiBold,
                                  ),
                                ),
                              ),
                            ),
                          ],

                          const Spacer(),

                          SizedBox(height: screenHeight * 0.03),

                          // Footer
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Vous vous souvenez de votre mot de passe?',
                                style: TextStyle(fontSize: isTablet ? 16 : 14),
                              ),
                              TextButton(
                                onPressed: () => context.go(RouteNames.login),
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  minimumSize: const Size(0, 36),
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                child: Text(
                                  'Se connecter',
                                  style: TextStyle(
                                    fontSize: isTablet ? 16 : 14,
                                    fontWeight: DesignTokens.fontWeightSemiBold,
                                    color: DesignTokens.primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: screenHeight * 0.02),
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
    );
  }
}
