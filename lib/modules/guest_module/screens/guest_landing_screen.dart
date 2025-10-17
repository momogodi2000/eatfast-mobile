import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:geolocator/geolocator.dart';
import 'package:eatfast_mobile/shared/config/router/route_names.dart';
import 'package:eatfast_mobile/shared/constants/app_constants.dart';
import 'package:eatfast_mobile/shared/themes/design_tokens.dart';
import '../widgets/widgets/guest_feature_cards.dart';
import 'package:eatfast_mobile/modules/guest_module/providers/guest_session_provider.dart';

/// Guest Landing Screen - Default page for unauthenticated users
/// Provides access to restaurant discovery, company info, and guest ordering
class GuestLandingScreen extends ConsumerStatefulWidget {
  const GuestLandingScreen({super.key});

  @override
  ConsumerState<GuestLandingScreen> createState() => _GuestLandingScreenState();
}

class _GuestLandingScreenState extends ConsumerState<GuestLandingScreen> {
  final ScrollController _scrollController = ScrollController();
  Position? _currentLocation;
  bool _isLoadingLocation = false;

  @override
  void initState() {
    super.initState();
    _initializeGuestSession();
    _getCurrentLocation();
  }

  Future<void> _initializeGuestSession() async {
    try {
      await ref.read(guestSessionProvider.notifier).ensureSession();
    } catch (e) {
      // Handle error silently for now - guest can still browse
      debugPrint('Failed to initialize guest session: $e');
    }
  }

  Future<void> _getCurrentLocation() async {
    setState(() {
      _isLoadingLocation = true;
    });

    try {
      // Check location permissions
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        _showLocationDialog('Location services are disabled.');
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          _showLocationDialog('Location permissions are denied.');
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        _showLocationDialog('Location permissions are permanently denied.');
        return;
      }

      // Get current position
      final position = await Geolocator.getCurrentPosition();
      setState(() {
        _currentLocation = position;
      });
    } catch (e) {
      _showLocationDialog('Error getting location: \$e');
    } finally {
      setState(() {
        _isLoadingLocation = false;
      });
    }
  }

  void _showLocationDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Location'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _navigateToRestaurants() {
    context.go(RouteNames.guestRestaurants);
  }

  void _navigateToAuth() {
    context.go(RouteNames.login);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DesignTokens.backgroundLight,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          // Guest App Bar
          SliverAppBar(
            expandedHeight: 120,
            floating: false,
            pinned: true,
            backgroundColor: DesignTokens.primaryColor,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      DesignTokens.primaryColor,
                      DesignTokens.primaryColor.withValues(alpha: 0.8),
                    ],
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(DesignTokens.spaceMD),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Bienvenue chez',
                                  style: TextStyle(
                                    color: DesignTokens.white.withValues(
                                      alpha: 0.9,
                                    ),
                                    fontSize: DesignTokens.fontSizeSM,
                                  ),
                                ),
                                Text(
                                  AppConstants.appName,
                                  style: const TextStyle(
                                    color: DesignTokens.white,
                                    fontSize: DesignTokens.fontSizeXL,
                                    fontWeight: DesignTokens.fontWeightBold,
                                  ),
                                ),
                              ],
                            ),
                            // Login Button
                            ElevatedButton(
                              onPressed: _navigateToAuth,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: DesignTokens.white,
                                foregroundColor: DesignTokens.primaryColor,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: DesignTokens.spaceMD,
                                  vertical: DesignTokens.spaceSM,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    DesignTokens.radiusSM,
                                  ),
                                ),
                              ),
                              child: const Text(
                                'Se connecter',
                                style: TextStyle(
                                  fontWeight: DesignTokens.fontWeightSemiBold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Main Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(DesignTokens.spaceMD),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Location Section
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(DesignTokens.spaceMD),
                    decoration: BoxDecoration(
                      color: DesignTokens.white,
                      borderRadius: BorderRadius.circular(
                        DesignTokens.radiusMD,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: DesignTokens.black.withValues(alpha: 0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: DesignTokens.primaryColor,
                              size: DesignTokens.iconMD,
                            ),
                            const SizedBox(width: DesignTokens.spaceSM),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Votre localisation',
                                    style: TextStyle(
                                      fontWeight:
                                          DesignTokens.fontWeightSemiBold,
                                      color: DesignTokens.textPrimary,
                                    ),
                                  ),
                                  Text(
                                    _isLoadingLocation
                                        ? 'Recherche en cours...'
                                        : _currentLocation != null
                                        ? 'Yaound�, Cameroun'
                                        : 'Localisation non disponible',
                                    style: TextStyle(
                                      color: DesignTokens.textSecondary,
                                      fontSize: DesignTokens.fontSizeSM,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (_isLoadingLocation)
                              const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: DesignTokens.spaceMD),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: _navigateToRestaurants,
                            icon: const Icon(Icons.restaurant),
                            label: const Text('D�couvrir les restaurants'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: DesignTokens.primaryColor,
                              foregroundColor: DesignTokens.white,
                              padding: const EdgeInsets.symmetric(
                                vertical: DesignTokens.spaceMD,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  DesignTokens.radiusSM,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: DesignTokens.spaceLG),

                  // Feature Cards
                  const GuestFeatureCards(),

                  const SizedBox(height: DesignTokens.spaceLG),

                  // Enterprise Links Section
                  Text(
                    '� propos d\'EatFast',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: DesignTokens.fontWeightBold,
                      color: DesignTokens.textPrimary,
                    ),
                  ),
                  const SizedBox(height: DesignTokens.spaceMD),

                  Row(
                    children: [
                      Expanded(
                        child: _buildEnterpriseCard(
                          context,
                          icon: Icons.info_outline,
                          title: 'Notre Histoire',
                          onTap: () => context.go(RouteNames.aboutUs),
                        ),
                      ),
                      const SizedBox(width: DesignTokens.spaceMD),
                      Expanded(
                        child: _buildEnterpriseCard(
                          context,
                          icon: Icons.contact_mail,
                          title: 'Nous Contacter',
                          onTap: () => context.go(RouteNames.contactUs),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: DesignTokens.spaceMD),

                  // Promotions Card
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(DesignTokens.spaceMD),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          DesignTokens.accentColor.withValues(alpha: 0.1),
                          DesignTokens.secondaryColor.withValues(alpha: 0.1),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(
                        DesignTokens.radiusMD,
                      ),
                      border: Border.all(
                        color: DesignTokens.accentColor.withValues(alpha: 0.3),
                      ),
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.local_offer,
                          color: DesignTokens.accentColor,
                          size: DesignTokens.iconLG,
                        ),
                        const SizedBox(height: DesignTokens.spaceSM),
                        Text(
                          'Promotions Sp�ciales',
                          style: TextStyle(
                            fontWeight: DesignTokens.fontWeightBold,
                            color: DesignTokens.textPrimary,
                          ),
                        ),
                        const SizedBox(height: DesignTokens.spaceXS),
                        Text(
                          'D�couvrez nos offres exclusives',
                          style: TextStyle(
                            color: DesignTokens.textSecondary,
                            fontSize: DesignTokens.fontSizeSM,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: DesignTokens.spaceMD),
                        ElevatedButton(
                          onPressed: () => context.go('/promotions'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: DesignTokens.accentColor,
                            foregroundColor: DesignTokens.white,
                          ),
                          child: const Text('Voir les promotions'),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: DesignTokens.spaceXXL),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEnterpriseCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(DesignTokens.spaceMD),
        decoration: BoxDecoration(
          color: DesignTokens.white,
          borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
          border: Border.all(
            color: DesignTokens.primaryColor.withValues(alpha: 0.2),
          ),
          boxShadow: [
            BoxShadow(
              color: DesignTokens.black.withValues(alpha: 0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: DesignTokens.primaryColor,
              size: DesignTokens.iconMD,
            ),
            const SizedBox(height: DesignTokens.spaceSM),
            Text(
              title,
              style: TextStyle(
                fontWeight: DesignTokens.fontWeightSemiBold,
                color: DesignTokens.textPrimary,
                fontSize: DesignTokens.fontSizeSM,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
