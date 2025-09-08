import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/theme/design_tokens.dart';
import '../../../../shared/widgets/buttons/app_button.dart';
import '../../../../core/auth/providers/auth_provider.dart';
import '../../providers/profile_api_provider.dart';

/// New Profile Screen using backend API
class ProfileApiScreen extends ConsumerStatefulWidget {
  const ProfileApiScreen({super.key});

  @override
  ConsumerState<ProfileApiScreen> createState() => _ProfileApiScreenState();
}

class _ProfileApiScreenState extends ConsumerState<ProfileApiScreen>
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

  @override
  void dispose() {
    _fadeAnimationController.dispose();
    _slideAnimationController.dispose();
    super.dispose();
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
        final imageFile = File(image.path);
        await ref.read(profileApiProvider.notifier).uploadProfileImage(imageFile);
      }
    } catch (e) {
      if (mounted) {
        _showErrorSnackBar('Erreur de sélection d\'image: $e');
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
                onTap: () {
                  Navigator.of(context).pop();
                  _pickProfileImage();
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Caméra'),
                onTap: () {
                  Navigator.of(context).pop();
                  _takeProfilePhoto();
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete),
                title: const Text('Supprimer'),
                onTap: () {
                  Navigator.of(context).pop();
                  _deleteProfileImage();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _takeProfilePhoto() async {
    try {
      final XFile? image = await _imagePicker.pickImage(
        source: ImageSource.camera,
        maxWidth: 512,
        maxHeight: 512,
        imageQuality: 80,
      );

      if (image != null) {
        final imageFile = File(image.path);
        await ref.read(profileApiProvider.notifier).uploadProfileImage(imageFile);
      }
    } catch (e) {
      if (mounted) {
        _showErrorSnackBar('Erreur de capture photo: $e');
      }
    }
  }

  Future<void> _deleteProfileImage() async {
    await ref.read(profileApiProvider.notifier).deleteProfileImage();
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: DesignTokens.errorColor,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  void _showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: DesignTokens.successColor,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Future<void> _refreshProfile() async {
    await ref.read(profileApiProvider.notifier).refresh();
  }

  @override
  Widget build(BuildContext context) {
    final profileState = ref.watch(profileApiProvider);
    final theme = Theme.of(context);

    // Listen to state changes for success/error messages
    ref.listen<AsyncValue<ProfileApiState>>(profileApiProvider, (previous, next) {
      next.whenData((state) {
        if (state.hasError && state.error != null) {
          _showErrorSnackBar(state.error!);
          ref.read(profileApiProvider.notifier).clearError();
        }
        if (state.hasSuccessMessage && state.successMessage != null) {
          _showSuccessSnackBar(state.successMessage!);
          ref.read(profileApiProvider.notifier).clearSuccessMessage();
        }
      });
    });

    return Scaffold(
      backgroundColor: DesignTokens.backgroundPrimary,
      body: profileState.when(
        data: (state) => _buildProfileContent(context, state, theme),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => _buildErrorContent(error.toString(), theme),
      ),
    );
  }

  Widget _buildErrorContent(String error, ThemeData theme) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 64,
            color: DesignTokens.errorColor,
          ),
          const SizedBox(height: 16),
          Text(
            'Erreur de chargement du profil',
            style: theme.textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            error,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: DesignTokens.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: _refreshProfile,
            child: const Text('Réessayer'),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileContent(BuildContext context, ProfileApiState state, ThemeData theme) {
    return Stack(
      children: [
        RefreshIndicator(
          onRefresh: _refreshProfile,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16),
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    _buildProfileHeader(state, theme),
                    const SizedBox(height: 32),
                    _buildProfileStats(state),
                    const SizedBox(height: 24),
                    _buildProfileMenu(context),
                    const SizedBox(height: 32),
                    _buildLogoutButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
        if (state.isLoading || state.isUpdatingProfile || state.isUploadingImage)
          Container(
            color: Colors.black26,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
      ],
    );
  }

  Widget _buildProfileHeader(ProfileApiState state, ThemeData theme) {
    final user = state.user;
    if (user == null) return const SizedBox.shrink();

    return Center(
      child: Column(
        children: [
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
                      color: DesignTokens.primaryColor,
                      width: 3,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: DesignTokens.primaryColor.withOpacity(0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 58,
                    backgroundColor: DesignTokens.surfaceColor,
                    backgroundImage: user.profileImage != null
                        ? NetworkImage(user.profileImage!)
                        : null,
                    child: user.profileImage == null
                        ? Text(
                            user.initials,
                            style: theme.textTheme.headlineLarge?.copyWith(
                              color: DesignTokens.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : null,
                  ),
                ),
                if (state.isUploadingImage)
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black54,
                      ),
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      ),
                    ),
                  ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: DesignTokens.primaryColor,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: DesignTokens.backgroundPrimary,
                        width: 2,
                      ),
                    ),
                    child: const Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text(
            user.fullName,
            style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: DesignTokens.textSecondary,
            ),
          ),
          const SizedBox(height: 8),
          _buildVerificationBadges(user),
          const SizedBox(height: 12),
          _buildLoyaltyBadge(user),
        ],
      ),
    );
  }

  Widget _buildVerificationBadges(user) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildVerificationBadge(
          'Email',
          user.isEmailVerified,
          Icons.email,
        ),
        const SizedBox(width: 12),
        _buildVerificationBadge(
          'Téléphone',
          user.isPhoneVerified,
          Icons.phone,
        ),
      ],
    );
  }

  Widget _buildVerificationBadge(String label, bool isVerified, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: isVerified 
            ? DesignTokens.successColor.withOpacity(0.1)
            : DesignTokens.warningColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isVerified 
              ? DesignTokens.successColor
              : DesignTokens.warningColor,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isVerified ? Icons.verified : Icons.warning,
            size: 14,
            color: isVerified 
                ? DesignTokens.successColor
                : DesignTokens.warningColor,
          ),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: DesignTokens.fontSizeSM,
              color: isVerified 
                  ? DesignTokens.successColor
                  : DesignTokens.warningColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoyaltyBadge(user) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(int.parse('0xFF${user.loyaltyLevelColor.substring(1)}')),
            Color(int.parse('0xFF${user.loyaltyLevelColor.substring(1)}'))
                .withOpacity(0.7),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Color(int.parse('0xFF${user.loyaltyLevelColor.substring(1)}'))
                .withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.star,
            size: 16,
            color: Colors.white,
          ),
          const SizedBox(width: 4),
          Text(
            '${user.loyaltyLevel} • ${user.loyaltyPoints} points',
            style: const TextStyle(
              fontSize: DesignTokens.fontSizeSM,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileStats(ProfileApiState state) {
    final user = state.user;
    if (user == null) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: DesignTokens.surfaceColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem(
            'Adresses',
            '${state.addresses.length}',
            Icons.location_on,
          ),
          _buildStatItem(
            'Points fidélité',
            '${user.loyaltyPoints}',
            Icons.star_rounded,
          ),
          _buildStatItem(
            'Membre depuis',
            _formatMemberSince(user.createdAt),
            Icons.calendar_today,
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(
          icon,
          size: 24,
          color: DesignTokens.primaryColor,
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontSize: DesignTokens.fontSizeLG,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: DesignTokens.fontSizeSM,
            color: DesignTokens.textSecondary,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  String _formatMemberSince(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);
    
    if (difference.inDays >= 365) {
      final years = (difference.inDays / 365).floor();
      return '${years}an${years > 1 ? 's' : ''}';
    } else if (difference.inDays >= 30) {
      final months = (difference.inDays / 30).floor();
      return '${months}mois';
    } else {
      return '${difference.inDays}j';
    }
  }

  Widget _buildProfileMenu(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Mon compte',
          style: const TextStyle(
            fontSize: DesignTokens.fontSizeLG,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        _buildMenuItem(
          context,
          'Modifier le profil',
          Icons.edit,
          () => context.push('/profile/edit'),
        ),
        _buildMenuItem(
          context,
          'Mes adresses',
          Icons.location_on_outlined,
          () => context.push('/profile/addresses'),
        ),
        _buildMenuItem(
          context,
          'Moyens de paiement',
          Icons.payment,
          () => context.push('/profile/payment-methods'),
        ),
        _buildMenuItem(
          context,
          'Notifications',
          Icons.notifications_outlined,
          () => context.push('/profile/notifications'),
        ),
        _buildMenuItem(
          context,
          'Confidentialité',
          Icons.privacy_tip_outlined,
          () => context.push('/profile/privacy'),
        ),
        _buildMenuItem(
          context,
          'Aide et support',
          Icons.help_outline,
          () => context.push('/support'),
        ),
      ],
    );
  }

  Widget _buildMenuItem(
    BuildContext context,
    String title,
    IconData icon,
    VoidCallback onTap,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Material(
        color: DesignTokens.surfaceColor,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: DesignTokens.primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    icon,
                    size: 20,
                    color: DesignTokens.primaryColor,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: DesignTokens.fontSizeMD,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: DesignTokens.textSecondary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogoutButton() {
    return Center(
      child: AppButton(
        text: 'Se déconnecter',
        onPressed: () async {
          await ref.read(authProvider.notifier).logout();
          if (mounted) {
            context.go('/login');
          }
        },
        style: AppButtonStyle.outline,
        icon: Icons.logout,
      ),
    );
  }
}
