import 'package:flutter/material.dart';
import 'package:eatfast_mobile/shared/themes/design_tokens.dart';

/// About Us Screen - Company story and mission
class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen>
    with SingleTickerProviderStateMixin {
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

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DesignTokens.backgroundPrimary,
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return CustomScrollView(
            slivers: [
              // App Bar with Hero Image
              SliverAppBar(
                expandedHeight: 250.0,
                floating: false,
                pinned: true,
                backgroundColor: DesignTokens.primaryColor,
                flexibleSpace: FlexibleSpaceBar(
                  title: FadeTransition(
                    opacity: _fadeAnimation,
                    child: const Text(
                      '� Propos de Nous',
                      style: TextStyle(
                        color: DesignTokens.white,
                        fontWeight: DesignTokens.fontWeightSemiBold,
                      ),
                    ),
                  ),
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      // Hero Image
                      Image.asset(
                        'assets/images/resto.jpeg',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: DesignTokens.primaryColor,
                            child: const Icon(
                              Icons.restaurant,
                              size: 80,
                              color: DesignTokens.white,
                            ),
                          );
                        },
                      ),
                      // Gradient Overlay
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              DesignTokens.primaryColor.withValues(alpha: 0.7),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Content
              SliverToBoxAdapter(
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: Padding(
                      padding: const EdgeInsets.all(DesignTokens.spaceLG),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Company Introduction
                          _buildSection(
                            context,
                            title: 'Notre Histoire',
                            content: '''
EatFast est n� d'une passion profonde pour la cuisine camerounaise et du d�sir de rendre accessible les d�licieux plats traditionnels de notre pays � tous les Camerounais.

Fond�e en 2025, notre plateforme connecte les amateurs de bonne cuisine avec les meilleurs restaurants locaux, cr�ant une communaut� culinaire vibrante qui c�l�bre la richesse gastronomique du Cameroun.
''',
                            icon: Icons.history,
                            color: DesignTokens.primaryColor,
                          ),

                          // Mission Section
                          _buildSection(
                            context,
                            title: 'Notre Mission',
                            content: '''
D�mocratiser l'acc�s � la cuisine camerounaise authentique en facilitant la d�couverte et la livraison de plats traditionnels et modernes pr�par�s avec amour par nos partenaires restaurateurs.

Nous nous engageons � :
� Soutenir les restaurants locaux
� Pr�server les traditions culinaires
� Offrir une exp�rience utilisateur exceptionnelle
� Cr�er des emplois pour les livreurs
''',
                            icon: Icons.flag,
                            color: DesignTokens.secondaryColor,
                          ),

                          // Values Section
                          _buildSection(
                            context,
                            title: 'Nos Valeurs',
                            content: '''
Authenticit� - Nous valorisons l'authenticit� des saveurs camerounaises
Qualit� - Chaque partenaire est s�lectionn� pour la qualit� de ses plats
Rapidit� - Livraison efficace dans les meilleurs d�lais
Proximit� - Nous restons proches de nos communaut�s locales
Innovation - Technologie au service de la tradition
''',
                            icon: Icons.favorite,
                            color: DesignTokens.accentColor,
                          ),

                          // Statistics Section
                          _buildStatisticsSection(context),

                          // Timeline Section
                          _buildTimelineSection(context),

                          // Testimonials
                          _buildTestimonialsSection(context),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildSection(
    BuildContext context, {
    required String title,
    required String content,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: DesignTokens.spaceLG),
      padding: const EdgeInsets.all(DesignTokens.spaceLG),
      decoration: BoxDecoration(
        color: DesignTokens.white,
        borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(DesignTokens.spaceSM),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(DesignTokens.radiusSM),
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: DesignTokens.iconLG,
                ),
              ),
              const SizedBox(width: DesignTokens.spaceMD),
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: DesignTokens.fontWeightSemiBold,
                    color: color,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: DesignTokens.spaceMD),
          Text(
            content.trim(),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              height: 1.6,
              color: DesignTokens.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatisticsSection(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: DesignTokens.spaceLG),
      padding: const EdgeInsets.all(DesignTokens.spaceLG),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            DesignTokens.primaryColor.withValues(alpha: 0.1),
            DesignTokens.secondaryColor.withValues(alpha: 0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
      ),
      child: Column(
        children: [
          Text(
            'Nos Chiffres',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: DesignTokens.fontWeightSemiBold,
            ),
          ),
          const SizedBox(height: DesignTokens.spaceLG),
          Row(
            children: [
              Expanded(
                child: _buildStatItem(
                  context,
                  '1000+',
                  'Commandes Livr�es',
                  Icons.delivery_dining,
                ),
              ),
              Expanded(
                child: _buildStatItem(
                  context,
                  '50+',
                  'Restaurants Partenaires',
                  Icons.restaurant,
                ),
              ),
            ],
          ),
          const SizedBox(height: DesignTokens.spaceMD),
          Row(
            children: [
              Expanded(
                child: _buildStatItem(
                  context,
                  '500+',
                  'Clients Satisfaits',
                  Icons.people,
                ),
              ),
              Expanded(
                child: _buildStatItem(
                  context,
                  '2',
                  'Villes Desservies',
                  Icons.location_city,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(BuildContext context, String number, String label, IconData icon) {
    return Column(
      children: [
        Icon(
          icon,
          size: DesignTokens.iconLG,
          color: DesignTokens.primaryColor,
        ),
        const SizedBox(height: DesignTokens.spaceXS),
        Text(
          number,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: DesignTokens.fontWeightBold,
            color: DesignTokens.primaryColor,
          ),
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: DesignTokens.textSecondary,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildTimelineSection(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: DesignTokens.spaceLG),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Notre Parcours',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: DesignTokens.fontWeightSemiBold,
            ),
          ),
          const SizedBox(height: DesignTokens.spaceLG),
          _buildTimelineItem(
            context,
            'Janvier 2025',
            'Conception et D�veloppement',
            'D�but du projet avec une �quipe passionn�e',
          ),
          _buildTimelineItem(
            context,
            'Mars 2025',
            'Partenariats Restaurants',
            'Signature des premiers restaurants partenaires',
          ),
          _buildTimelineItem(
            context,
            'Septembre 2025',
            'Lancement de l\'Application',
            'Mise en ligne officielle d\'EatFast',
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineItem(BuildContext context, String date, String title, String description) {
    return Container(
      margin: const EdgeInsets.only(bottom: DesignTokens.spaceMD),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: const BoxDecoration(
              color: DesignTokens.primaryColor,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: DesignTokens.spaceMD),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  date,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: DesignTokens.primaryColor,
                    fontWeight: DesignTokens.fontWeightSemiBold,
                  ),
                ),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: DesignTokens.fontWeightSemiBold,
                  ),
                ),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: DesignTokens.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTestimonialsSection(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: DesignTokens.spaceLG),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ce que disent nos clients',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: DesignTokens.fontWeightSemiBold,
            ),
          ),
          const SizedBox(height: DesignTokens.spaceLG),
          _buildTestimonialCard(
            context,
            'Excellente application! Les plats arrivent toujours chauds et d�licieux.',
            'Marie T.',
            'Cliente r�guli�re',
          ),
          const SizedBox(height: DesignTokens.spaceMD),
          _buildTestimonialCard(
            context,
            'Parfait pour d�couvrir de nouveaux restaurants camerounais.',
            'Jean P.',
            'Amateur de cuisine',
          ),
        ],
      ),
    );
  }

  Widget _buildTestimonialCard(BuildContext context, String quote, String author, String role) {
    return Container(
      padding: const EdgeInsets.all(DesignTokens.spaceLG),
      decoration: BoxDecoration(
        color: DesignTokens.backgroundSecondary,
        borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
        border: Border.all(
          color: DesignTokens.lightGrey,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.format_quote,
            color: DesignTokens.primaryColor.withValues(alpha: 0.5),
            size: DesignTokens.iconLG,
          ),
          const SizedBox(height: DesignTokens.spaceXS),
          Text(
            quote,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontStyle: FontStyle.italic,
              height: 1.5,
            ),
          ),
          const SizedBox(height: DesignTokens.spaceMD),
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: DesignTokens.primaryColor,
                child: Text(
                  author.substring(0, 1),
                  style: const TextStyle(
                    color: DesignTokens.white,
                    fontWeight: DesignTokens.fontWeightBold,
                  ),
                ),
              ),
              const SizedBox(width: DesignTokens.spaceMD),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    author,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: DesignTokens.fontWeightSemiBold,
                    ),
                  ),
                  Text(
                    role,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: DesignTokens.textSecondary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
