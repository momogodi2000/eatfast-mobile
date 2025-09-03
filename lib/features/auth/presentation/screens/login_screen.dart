import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/router/route_names.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/design_tokens.dart';
import '../../../../core/utils/validators.dart';
import '../../providers/auth_provider.dart';

/// Login Screen with email/password and phone options
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen>
    with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  
  bool _isPasswordVisible = false;
  bool _isEmailLogin = true;
  bool _rememberMe = false;
  
  late AnimationController _slideAnimationController;
  late AnimationController _fadeAnimationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
  }

  void _initializeAnimations() {
    _slideAnimationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    
    _fadeAnimationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideAnimationController,
      curve: Curves.easeOut,
    ));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeAnimationController,
      curve: Curves.easeIn,
    ));

    _slideAnimationController.forward();
    _fadeAnimationController.forward();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _slideAnimationController.dispose();
    _fadeAnimationController.dispose();
    super.dispose();
  }

  void _login() {
    if (_formKey.currentState?.validate() ?? false) {
      if (_isEmailLogin) {
        ref.read(authProvider.notifier).loginWithEmail(
          _emailController.text.trim(),
          _passwordController.text,
        );
      } else {
        ref.read(authProvider.notifier).loginWithPhone(
          _phoneController.text.trim(),
        );
      }
    }
  }

  void _toggleLoginMethod() {
    setState(() {
      _isEmailLogin = !_isEmailLogin;
    });
    _formKey.currentState?.reset();
  }

  void _navigateToRegister() {
    context.go(RouteNames.register);
  }

  void _navigateToForgotPassword() {
    context.go(RouteNames.forgotPassword);
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AuthState>(authProvider, (previous, next) {
      if (next is AuthAuthenticated) {
        context.go(RouteNames.home);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(AppConstants.loginSuccess),
            backgroundColor: DesignTokens.successColor,
          ),
        );
      } else if (next is AuthError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.message),
            backgroundColor: DesignTokens.errorColor,
          ),
        );
      } else if (next is AuthOtpSent) {
        context.go('${RouteNames.otpVerification}?phone=${next.phoneNumber}');
      }
    });

    final authState = ref.watch(authProvider);
    final isLoading = authState is AuthLoading;

    return Scaffold(
      backgroundColor: DesignTokens.backgroundPrimary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go(RouteNames.welcome),
        ),
      ),
      body: AnimatedBuilder(
        animation: Listenable.merge([_slideAnimationController, _fadeAnimationController]),
        builder: (context, child) {
          return FadeTransition(
            opacity: _fadeAnimation,
            child: SlideTransition(
              position: _slideAnimation,
              child: SafeArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(DesignTokens.spaceLG),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header Section
                        _buildHeader(context),
                        
                        const SizedBox(height: DesignTokens.spaceXXL),
                        
                        // Login Method Selector
                        _buildLoginMethodSelector(),
                        
                        const SizedBox(height: DesignTokens.spaceLG),
                        
                        // Login Form
                        if (_isEmailLogin) _buildEmailLoginForm() else _buildPhoneLoginForm(),
                        
                        const SizedBox(height: DesignTokens.spaceLG),
                        
                        // Remember Me & Forgot Password
                        if (_isEmailLogin) _buildRememberMeAndForgotPassword(),
                        
                        const SizedBox(height: DesignTokens.spaceXL),
                        
                        // Login Button
                        _buildLoginButton(isLoading),
                        
                        const SizedBox(height: DesignTokens.spaceLG),
                        
                        // Divider
                        _buildDivider(),
                        
                        const SizedBox(height: DesignTokens.spaceLG),
                        
                        // Social Login Buttons
                        _buildSocialLoginButtons(),
                        
                        const SizedBox(height: DesignTokens.spaceXL),
                        
                        // Register Link
                        _buildRegisterLink(),
                      ],
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

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // App Logo
        Center(
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: DesignTokens.primaryColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.restaurant,
              size: 40,
              color: DesignTokens.primaryColor,
            ),
          ),
        ),
        
        const SizedBox(height: DesignTokens.spaceLG),
        
        // Welcome Text
        Text(
          'Bon retour!',
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
            fontWeight: DesignTokens.fontWeightBold,
            color: DesignTokens.textPrimary,
          ),
        ),
        
        const SizedBox(height: DesignTokens.spaceXS),
        
        Text(
          'Connectez-vous pour continuer votre expérience culinaire',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: DesignTokens.textSecondary,
            height: 1.4,
          ),
        ),
      ],
    );
  }

  Widget _buildLoginMethodSelector() {
    return Container(
      decoration: BoxDecoration(
        color: DesignTokens.backgroundSecondary,
        borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => _toggleLoginMethod(),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: DesignTokens.spaceMD),
                decoration: BoxDecoration(
                  color: _isEmailLogin ? DesignTokens.primaryColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
                ),
                child: Text(
                  'Email',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: _isEmailLogin ? DesignTokens.white : DesignTokens.textSecondary,
                    fontWeight: DesignTokens.fontWeightMedium,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => _toggleLoginMethod(),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: DesignTokens.spaceMD),
                decoration: BoxDecoration(
                  color: !_isEmailLogin ? DesignTokens.primaryColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
                ),
                child: Text(
                  'Téléphone',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: !_isEmailLogin ? DesignTokens.white : DesignTokens.textSecondary,
                    fontWeight: DesignTokens.fontWeightMedium,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmailLoginForm() {
    return Column(
      children: [
        // Email Field
        TextFormField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            labelText: 'Adresse email',
            prefixIcon: Icon(Icons.email_outlined),
            hintText: 'exemple@email.com',
          ),
          validator: Validators.validateEmail,
        ),
        
        const SizedBox(height: DesignTokens.spaceMD),
        
        // Password Field
        TextFormField(
          controller: _passwordController,
          obscureText: !_isPasswordVisible,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            labelText: 'Mot de passe',
            prefixIcon: const Icon(Icons.lock_outline),
            suffixIcon: IconButton(
              icon: Icon(
                _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
            ),
          ),
          validator: Validators.validatePassword,
          onFieldSubmitted: (_) => _login(),
        ),
      ],
    );
  }

  Widget _buildPhoneLoginForm() {
    return Column(
      children: [
        TextFormField(
          controller: _phoneController,
          keyboardType: TextInputType.phone,
          textInputAction: TextInputAction.done,
          decoration: const InputDecoration(
            labelText: 'Numéro de téléphone',
            prefixIcon: Icon(Icons.phone_outlined),
            hintText: '+237 6XX XXX XXX',
          ),
          validator: Validators.validatePhone,
          onFieldSubmitted: (_) => _login(),
        ),
        
        const SizedBox(height: DesignTokens.spaceMD),
        
        Container(
          padding: const EdgeInsets.all(DesignTokens.spaceMD),
          decoration: BoxDecoration(
            color: DesignTokens.infoColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(DesignTokens.radiusSM),
            border: Border.all(
              color: DesignTokens.infoColor.withOpacity(0.3),
            ),
          ),
          child: Row(
            children: [
              const Icon(
                Icons.info_outline,
                color: DesignTokens.infoColor,
                size: DesignTokens.iconSM,
              ),
              const SizedBox(width: DesignTokens.spaceXS),
              Expanded(
                child: Text(
                  'Un code de vérification sera envoyé à ce numéro',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: DesignTokens.infoColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRememberMeAndForgotPassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Remember Me
        Row(
          children: [
            Checkbox(
              value: _rememberMe,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value ?? false;
                });
              },
              activeColor: DesignTokens.primaryColor,
            ),
            Text(
              'Se souvenir de moi',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        
        // Forgot Password
        TextButton(
          onPressed: _navigateToForgotPassword,
          child: const Text(
            'Mot de passe oublié?',
            style: TextStyle(
              color: DesignTokens.primaryColor,
              fontWeight: DesignTokens.fontWeightMedium,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginButton(bool isLoading) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isLoading ? null : _login,
        child: isLoading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(DesignTokens.white),
                ),
              )
            : Text(
                _isEmailLogin ? 'Se connecter' : 'Envoyer le code',
                style: const TextStyle(
                  fontSize: DesignTokens.fontSizeMD,
                  fontWeight: DesignTokens.fontWeightSemiBold,
                ),
              ),
      ),
    );
  }

  Widget _buildDivider() {
    return Row(
      children: [
        const Expanded(child: Divider()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: DesignTokens.spaceMD),
          child: Text(
            'OU',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: DesignTokens.textTertiary,
            ),
          ),
        ),
        const Expanded(child: Divider()),
      ],
    );
  }

  Widget _buildSocialLoginButtons() {
    return Column(
      children: [
        // Google Login
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () {
              // TODO: Implement Google login
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Connexion Google bientôt disponible')),
              );
            },
            icon: const Icon(Icons.g_mobiledata, size: 24),
            label: const Text('Continuer avec Google'),
          ),
        ),
        
        const SizedBox(height: DesignTokens.spaceMD),
        
        // Facebook Login
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () {
              // TODO: Implement Facebook login
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Connexion Facebook bientôt disponible')),
              );
            },
            icon: const Icon(Icons.facebook, size: 24),
            label: const Text('Continuer avec Facebook'),
          ),
        ),
      ],
    );
  }

  Widget _buildRegisterLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Pas encore de compte? ',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        TextButton(
          onPressed: _navigateToRegister,
          child: const Text(
            'Créer un compte',
            style: TextStyle(
              color: DesignTokens.primaryColor,
              fontWeight: DesignTokens.fontWeightSemiBold,
            ),
          ),
        ),
      ],
    );
  }
}
