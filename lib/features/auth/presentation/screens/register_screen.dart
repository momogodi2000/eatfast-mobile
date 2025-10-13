import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/router/route_names.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/design_tokens.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/auth/providers/unified_auth_provider.dart';
import '../../../../core/auth/models/app_user.dart';

/// Registration Screen
class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen>
    with TickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _acceptTerms = false;

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onRegisterPressed() {
    if (_formKey.currentState?.validate() ?? false) {
      if (!_acceptTerms) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Veuillez accepter les conditions d\'utilisation'),
            backgroundColor: DesignTokens.errorColor,
          ),
        );
        return;
      }

      ref.read(authProvider.notifier).register(
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text,
        confirmPassword: _confirmPasswordController.text,
        phone: _phoneController.text.trim(),
        role: UserRole.customer,
      );
    }
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Veuillez confirmer votre mot de passe';
    }
    if (value != _passwordController.text) {
      return 'Les mots de passe ne correspondent pas';
    }
    return null;
  }

  void _signInWithGoogle() async {
    await ref.read(authProvider.notifier).signInWithGoogle();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);

    // Listen to auth state changes
    ref.listen<AuthState>(authProvider, (previous, next) {
      if (next.isAuthenticated) {
        context.go(RouteNames.home);
      } else if (next.error != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.error!),
            backgroundColor: DesignTokens.errorColor,
          ),
        );
      }
    });

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          context.go(RouteNames.guestLanding);
        }
      },
      child: Scaffold(
        backgroundColor: DesignTokens.backgroundPrimary,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => context.go(RouteNames.guestLanding),
          ),
          title: const Text('Inscription'),
        ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(DesignTokens.spaceLG),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              _buildHeader(),
              
              const SizedBox(height: DesignTokens.spaceXL),
              
              // Registration Form
              _buildRegistrationForm(authState),
              
              const SizedBox(height: DesignTokens.spaceLG),
              
              // Terms and Conditions
              _buildTermsCheckbox(),
              
              const SizedBox(height: DesignTokens.spaceLG),
              
              // Register Button
              _buildRegisterButton(authState),

              const SizedBox(height: DesignTokens.spaceLG),

              // Social Login Divider
              _buildSocialLoginDivider(),

              const SizedBox(height: DesignTokens.spaceLG),

              // Google Sign-In Button
              _buildGoogleSignInButton(authState.isLoading),

              const SizedBox(height: DesignTokens.spaceLG),

              // Footer
              _buildFooter(),
            ],
          ),
        ),
      ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Créer un compte',
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
            fontWeight: DesignTokens.fontWeightBold,
          ),
        ),
        const SizedBox(height: DesignTokens.spaceXS),
        Text(
          'Rejoignez ${AppConstants.appName} et découvrez la meilleure cuisine camerounaise',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: DesignTokens.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildRegistrationForm(AuthState authState) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // Full Name
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Nom complet',
              prefixIcon: Icon(Icons.person_outline),
            ),
            textCapitalization: TextCapitalization.words,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Veuillez entrer votre nom complet';
              }
              if (value.trim().length < 2) {
                return 'Le nom doit contenir au moins 2 caractères';
              }
              return null;
            },
            enabled: !authState.isLoading,
          ),
          const SizedBox(height: DesignTokens.spaceMD),
          
          // Email
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: 'Adresse email',
              prefixIcon: Icon(Icons.email_outlined),
            ),
            keyboardType: TextInputType.emailAddress,
            validator: Validators.validateEmail,
            enabled: !authState.isLoading,
          ),
          const SizedBox(height: DesignTokens.spaceMD),
          
          // Phone
          TextFormField(
            controller: _phoneController,
            decoration: const InputDecoration(
              labelText: 'Numéro de téléphone',
              prefixIcon: Icon(Icons.phone_outlined),
              hintText: '+237 6XX XXX XXX',
            ),
            keyboardType: TextInputType.phone,
            validator: Validators.validatePhone,
            enabled: !authState.isLoading,
          ),
          const SizedBox(height: DesignTokens.spaceMD),
          
          // Password
          TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: 'Mot de passe',
              prefixIcon: const Icon(Icons.lock_outline),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
            ),
            obscureText: _obscurePassword,
            validator: Validators.validatePassword,
            enabled: !authState.isLoading,
          ),
          const SizedBox(height: DesignTokens.spaceMD),
          
          // Confirm Password
          TextFormField(
            controller: _confirmPasswordController,
            decoration: InputDecoration(
              labelText: 'Confirmer le mot de passe',
              prefixIcon: const Icon(Icons.lock_outline),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _obscureConfirmPassword = !_obscureConfirmPassword;
                  });
                },
              ),
            ),
            obscureText: _obscureConfirmPassword,
            validator: _validateConfirmPassword,
            enabled: !authState.isLoading,
          ),
        ],
      ),
    );
  }

  Widget _buildTermsCheckbox() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Checkbox(
          value: _acceptTerms,
          onChanged: (value) {
            setState(() {
              _acceptTerms = value ?? false;
            });
          },
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _acceptTerms = !_acceptTerms;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(top: DesignTokens.spaceXS),
              child: RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.bodyMedium,
                  children: [
                    const TextSpan(text: 'J\'accepte les '),
                    WidgetSpan(
                      child: GestureDetector(
                        onTap: () => context.go(RouteNames.terms),
                        child: Text(
                          'conditions d\'utilisation',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: DesignTokens.primaryColor,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                    const TextSpan(text: ' et la '),
                    WidgetSpan(
                      child: GestureDetector(
                        onTap: () => context.go(RouteNames.terms),
                        child: Text(
                          'politique de confidentialité',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: DesignTokens.primaryColor,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRegisterButton(AuthState authState) {
    final isLoading = authState.isLoading;
    
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isLoading ? null : _onRegisterPressed,
        child: isLoading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(DesignTokens.white),
                ),
              )
            : const Text(
                'Créer mon compte',
                style: TextStyle(
                  fontSize: DesignTokens.fontSizeLG,
                  fontWeight: DesignTokens.fontWeightSemiBold,
                ),
              ),
      ),
    );
  }

  Widget _buildSocialLoginDivider() {
    return Row(
      children: [
        const Expanded(child: Divider(color: DesignTokens.borderColor)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: DesignTokens.spaceMD),
          child: Text(
            'Ou s\'inscrire avec',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: DesignTokens.textSecondary,
            ),
          ),
        ),
        const Expanded(child: Divider(color: DesignTokens.borderColor)),
      ],
    );
  }

  Widget _buildGoogleSignInButton(bool isLoading) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: isLoading ? null : _signInWithGoogle,
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: DesignTokens.spaceMD),
          side: const BorderSide(color: DesignTokens.borderColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
          ),
        ),
        icon: Image.asset(
          'assets/images/google_logo.png',
          height: 24,
          width: 24,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(Icons.login, color: DesignTokens.textPrimary);
          },
        ),
        label: const Text(
          'S\'inscrire avec Google',
          style: TextStyle(
            color: DesignTokens.textPrimary,
            fontSize: DesignTokens.fontSizeMD,
            fontWeight: DesignTokens.fontWeightMedium,
          ),
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Vous avez déjà un compte ?'),
        TextButton(
          onPressed: () => context.go(RouteNames.login),
          child: const Text('Se connecter'),
        ),
      ],
    );
  }
}
