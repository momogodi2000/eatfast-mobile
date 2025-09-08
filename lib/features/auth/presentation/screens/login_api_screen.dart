import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/design_tokens.dart';
import '../../../../shared/widgets/buttons/app_button.dart';
import '../../providers/auth_api_provider.dart';
import '../../domain/auth_user.dart';

/// New API-based Login Screen
class LoginApiScreen extends ConsumerStatefulWidget {
  const LoginApiScreen({super.key});

  @override
  ConsumerState<LoginApiScreen> createState() => _LoginApiScreenState();
}

class _LoginApiScreenState extends ConsumerState<LoginApiScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  
  bool _rememberMe = false;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    if (_formKey.currentState?.validate() ?? false) {
      ref.read(authApiProvider.notifier).login(
        _emailController.text.trim(),
        _passwordController.text,
        rememberMe: _rememberMe,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authApiProvider);

    // Listen for state changes
    ref.listen<AuthApiState>(authApiProvider, (previous, next) {
      next.when(
        initial: () {},
        loading: () {},
        authenticated: (user) {
          // Navigation logic based on user role
          switch (user.role) {
            case 'client':
              context.go('/home');
              break;
            case 'admin':
              context.go('/admin-dashboard');
              break;
            case 'restaurant_owner':
              context.go('/restaurant-dashboard');
              break;
            case 'driver':
              context.go('/driver-dashboard');
              break;
            default:
              context.go('/home');
          }
        },
        unauthenticated: () {},
        error: (message, code) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(message),
              backgroundColor: DesignTokens.errorColor,
            ),
          );
        },
        loggingIn: () {},
        registering: () {},
        resettingPassword: () {},
        verifyingOtp: () {},
        changingPassword: () {},
      );
    });

    return Scaffold(
      backgroundColor: DesignTokens.backgroundPrimary,
      appBar: AppBar(
        title: const Text('Connexion API'),
        backgroundColor: DesignTokens.primaryColor,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(DesignTokens.spaceLG),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: DesignTokens.spaceXL),
                
                // Welcome Text
                const Text(
                  'Bienvenue sur EatFast',
                  style: TextStyle(
                    fontSize: DesignTokens.fontSizeXXL,
                    fontWeight: FontWeight.bold,
                    color: DesignTokens.textPrimary,
                  ),
                  textAlign: TextAlign.center,
                ),
                
                const SizedBox(height: DesignTokens.spaceSM),
                
                const Text(
                  'Connectez-vous pour continuer',
                  style: TextStyle(
                    fontSize: DesignTokens.fontSizeMD,
                    color: DesignTokens.textSecondary,
                  ),
                  textAlign: TextAlign.center,
                ),
                
                const SizedBox(height: DesignTokens.spaceXL),
                
                // Email Field
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: const Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez saisir votre email';
                    }
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                      return 'Format d\'email invalide';
                    }
                    return null;
                  },
                ),
                
                const SizedBox(height: DesignTokens.spaceMD),
                
                // Password Field
                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    labelText: 'Mot de passe',
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez saisir votre mot de passe';
                    }
                    if (value.length < 6) {
                      return 'Le mot de passe doit contenir au moins 6 caractères';
                    }
                    return null;
                  },
                ),
                
                const SizedBox(height: DesignTokens.spaceMD),
                
                // Remember Me Checkbox
                Row(
                  children: [
                    Checkbox(
                      value: _rememberMe,
                      onChanged: (value) {
                        setState(() {
                          _rememberMe = value ?? false;
                        });
                      },
                    ),
                    const Text('Se souvenir de moi'),
                  ],
                ),
                
                const SizedBox(height: DesignTokens.spaceLG),
                
                // Login Button
                authState.when(
                  initial: () => _buildLoginButton(false),
                  loading: () => _buildLoginButton(true),
                  authenticated: (_) => _buildLoginButton(false),
                  unauthenticated: () => _buildLoginButton(false),
                  error: (_, __) => _buildLoginButton(false),
                  loggingIn: () => _buildLoginButton(true),
                  registering: () => _buildLoginButton(true),
                  resettingPassword: () => _buildLoginButton(false),
                  verifyingOtp: () => _buildLoginButton(false),
                  changingPassword: () => _buildLoginButton(false),
                ),
                
                const SizedBox(height: DesignTokens.spaceMD),
                
                // Forgot Password Link
                TextButton(
                  onPressed: () {
                    context.go('/forgot-password');
                  },
                  child: const Text('Mot de passe oublié ?'),
                ),
                
                const SizedBox(height: DesignTokens.spaceMD),
                
                // Register Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Pas encore de compte ? '),
                    TextButton(
                      onPressed: () {
                        context.go('/register-api');
                      },
                      child: const Text('S\'inscrire'),
                    ),
                  ],
                ),
                
                const Spacer(),
                
                // Test with Mock Profile Button (for testing)
                TextButton.icon(
                  onPressed: () {
                    context.go('/profile-api');
                  },
                  icon: const Icon(Icons.api),
                  label: const Text('Tester le profil API'),
                  style: TextButton.styleFrom(
                    foregroundColor: DesignTokens.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton(bool isLoading) {
    return AppButton(
      onPressed: isLoading ? null : _handleLogin,
      text: 'Se connecter',
      isLoading: isLoading,
      style: AppButtonStyle.primary,
      size: AppButtonSize.large,
    );
  }
}
