import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/theme/design_tokens.dart';
import '../../../../shared/widgets/buttons/app_button.dart';
import '../../../../core/auth/providers/auth_provider.dart';
import '../../../auth/providers/auth_state.dart';
import '../../providers/profile_provider.dart';

/// Profile Screen - Main profile view and management
class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen>
    with TickerProviderStateMixin {
  late AnimationController _fadeAnimationController;
  late AnimationController _slideAnimationController;
  
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  final ImagePicker _imagePicker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _startAnimations();
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
  }

  void _startAnimations() {
    _fadeAnimationController.forward();
    Future.delayed(const Duration(milliseconds: 200), () {
      _slideAnimationController.forward();
    });
  }

  Future<void> _pickProfileImage() async {
    try {
      final XFile? image = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 512,
        maxHeight: 512,
        imageQuality: 80,
      );

      if (image != null) {
        await ref.read(profileProvider.notifier).updateProfilePicture(image.path);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erreur de sélection d\'image: $e'),
            backgroundColor: DesignTokens.errorColor,
          ),
        );
      }
    }
  }

  Future<void> _showImagePickerDialog() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Changer la photo de profil'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Galerie'),
                onTap: () async {
                  Navigator.of(context).pop();
                  await _pickProfileImage();
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Appareil photo'),
                onTap: () async {
                  Navigator.of(context).pop();
                  try {
                    final XFile? image = await _imagePicker.pickImage(
                      source: ImageSource.camera,
                      maxWidth: 512,
                      maxHeight: 512,
                      imageQuality: 80,
                    );

                    if (image != null) {
                      await ref.read(profileProvider.notifier).updateProfilePicture(image.path);
                    }
                  } catch (e) {
                    if (mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Erreur de capture d\'image: $e'),
                          backgroundColor: DesignTokens.errorColor,
                        ),
                      );
                    }
                  }
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Annuler'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _fadeAnimationController.dispose();
    _slideAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);

    if (authState is! AuthAuthenticated) {
      return const Scaffold(
        body: Center(
          child: Text('Veuillez vous connecter pour accéder au profil'),
        ),
      );
    }

    final user = authState.user;

    return Scaffold(
      backgroundColor: DesignTokens.backgroundPrimary,
      body: AnimatedBuilder(
        animation: Listenable.merge([_fadeAnimationController, _slideAnimationController]),
        builder: (context, child) {
          return FadeTransition(
            opacity: _fadeAnimation,
            child: SlideTransition(
              position: _slideAnimation,
              child: CustomScrollView(
                slivers: [
                  // Custom App Bar
                  _buildSliverAppBar(user),
                  
                  // Profile Content
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(DesignTokens.spaceLG),
                      child: Column(
                        children: [
                          const SizedBox(height: DesignTokens.spaceXL),
                          
                          // Profile Actions Grid
                          _buildProfileActionsGrid(),
                          
                          const SizedBox(height: DesignTokens.spaceXL),
                          
                          // Settings Section
                          _buildSettingsSection(),
                          
                          const SizedBox(height: DesignTokens.spaceXL),
                          
                          // Account Actions
                          _buildAccountActions(),
                          
                          const SizedBox(height: DesignTokens.spaceXXL),
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
    );
  }

  Widget _buildSliverAppBar(dynamic user) {
    return SliverAppBar(
      expandedHeight: 300,
      floating: false,
      pinned: true,
      backgroundColor: DesignTokens.primaryColor,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                DesignTokens.primaryColor,
                DesignTokens.primaryColor.withValues(alpha: 0.8),
              ],
            ),
          ),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: DesignTokens.spaceXL),
                
                // Profile Picture
                GestureDetector(
                  onTap: _showImagePickerDialog,
                  child: Stack(
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: DesignTokens.white,
                            width: 4,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: DesignTokens.black.withValues(alpha: 0.2),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: user.profilePicture != null
                              ? (user.profilePicture!.startsWith('http')
                                  ? Image.network(
                                      user.profilePicture!,
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error, stackTrace) {
                                        return _buildDefaultAvatar();
                                      },
                                    )
                                  : Image.file(
                                      File(user.profilePicture!),
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error, stackTrace) {
                                        return _buildDefaultAvatar();
                                      },
                                    ))
                              : _buildDefaultAvatar(),
                        ),
                      ),
                      
                      // Edit Icon
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: DesignTokens.secondaryColor,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: DesignTokens.white,
                              width: 2,
                            ),
                          ),
                          child: const Icon(
                            Icons.edit,
                            color: DesignTokens.white,
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: DesignTokens.spaceMD),
                
                // User Name
                Text(
                  user.name ?? 'Utilisateur',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: DesignTokens.white,
                    fontWeight: DesignTokens.fontWeightBold,
                  ),
                ),
                
                const SizedBox(height: DesignTokens.spaceXS),
                
                // User Email/Phone
                Text(
                  user.email?.isNotEmpty == true ? user.email! : user.phone ?? 'Non renseigné',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: DesignTokens.white.withValues(alpha: 0.9),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.settings, color: DesignTokens.white),
          onPressed: () {
            // Navigate to settings
            context.go('/settings');
          },
        ),
      ],
    );
  }

  Widget _buildDefaultAvatar() {
    return Container(
      color: DesignTokens.lightGrey,
      child: const Icon(
        Icons.person,
        size: 60,
        color: DesignTokens.white,
      ),
    );
  }

  Widget _buildProfileActionsGrid() {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: DesignTokens.spaceMD,
      crossAxisSpacing: DesignTokens.spaceMD,
      childAspectRatio: 1.2,
      children: [
        _buildActionCard(
          icon: Icons.edit,
          title: 'Modifier le profil',
          subtitle: 'Nom, email, téléphone',
          onTap: () => context.go('/edit-profile'),
        ),
        _buildActionCard(
          icon: Icons.location_on,
          title: 'Mes adresses',
          subtitle: 'Gérer les adresses',
          onTap: () => context.go('/addresses'),
        ),
        _buildActionCard(
          icon: Icons.payment,
          title: 'Paiements',
          subtitle: 'Méthodes de paiement',
          onTap: () => context.go('/payment-methods'),
        ),
        _buildActionCard(
          icon: Icons.history,
          title: 'Historique',
          subtitle: 'Commandes passées',
          onTap: () => context.go('/order-history'),
        ),
      ],
    );
  }

  Widget _buildActionCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Material(
      color: DesignTokens.white,
      borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
      elevation: DesignTokens.elevation1,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
        child: Padding(
          padding: const EdgeInsets.all(DesignTokens.spaceMD),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 32,
                color: DesignTokens.primaryColor,
              ),
              const SizedBox(height: DesignTokens.spaceXS),
              Text(
                title,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: DesignTokens.fontWeightSemiBold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: DesignTokens.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsSection() {
    return Container(
      decoration: BoxDecoration(
        color: DesignTokens.white,
        borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
        boxShadow: [
          BoxShadow(
            color: DesignTokens.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(DesignTokens.spaceLG),
            child: Text(
              'Paramètres',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: DesignTokens.fontWeightSemiBold,
              ),
            ),
          ),
          
          _buildSettingsTile(
            icon: Icons.notifications,
            title: 'Notifications',
            subtitle: 'Gérer les notifications',
            onTap: () => context.go('/notification-settings'),
          ),
          
          _buildSettingsTile(
            icon: Icons.fingerprint,
            title: 'Authentification biométrique',
            subtitle: 'Empreinte digitale, Face ID',
            onTap: () => _showBiometricSetup(),
          ),
          
          _buildSettingsTile(
            icon: Icons.language,
            title: 'Langue',
            subtitle: 'Français, Anglais',
            onTap: () => _showLanguageSelector(),
          ),
          
          _buildSettingsTile(
            icon: Icons.help,
            title: 'Aide & Support',
            subtitle: 'FAQ, Contacter le support',
            onTap: () => context.go('/help'),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: DesignTokens.spaceLG,
          vertical: DesignTokens.spaceMD,
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: DesignTokens.primaryColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(DesignTokens.radiusSM),
              ),
              child: Icon(
                icon,
                color: DesignTokens.primaryColor,
                size: 20,
              ),
            ),
            const SizedBox(width: DesignTokens.spaceMD),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: DesignTokens.fontWeightMedium,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: DesignTokens.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.chevron_right,
              color: DesignTokens.textSecondary,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountActions() {
    return Column(
      children: [
        AppButton(
          onPressed: () async {
            await ref.read(authProvider.notifier).logout();
            if (mounted) {
              context.go('/login');
            }
          },
          text: 'Se déconnecter',
          style: AppButtonStyle.outline,
          width: double.infinity,
          icon: Icons.logout,
        ),
        
        const SizedBox(height: DesignTokens.spaceMD),
        
        AppButton(
          onPressed: () => _showDeleteAccountDialog(),
          text: 'Supprimer le compte',
          style: AppButtonStyle.danger,
          width: double.infinity,
          icon: Icons.delete_forever,
        ),
      ],
    );
  }

  void _showBiometricSetup() {
    // TODO: Implement biometric setup dialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Authentification biométrique'),
        content: const Text('Fonctionnalité en cours de développement'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showLanguageSelector() {
    // TODO: Implement language selector
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Choisir la langue'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('Français'),
              leading: const Icon(Icons.check),
              onTap: () => Navigator.of(context).pop(),
            ),
            ListTile(
              title: const Text('English'),
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Annuler'),
          ),
        ],
      ),
    );
  }

  void _showDeleteAccountDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Supprimer le compte'),
        content: const Text(
          'Êtes-vous sûr de vouloir supprimer votre compte ? Cette action est irréversible.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Annuler'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              // TODO: Implement account deletion
            },
            style: TextButton.styleFrom(
              foregroundColor: DesignTokens.errorColor,
            ),
            child: const Text('Supprimer'),
          ),
        ],
      ),
    );
  }
}
