import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/design_tokens.dart';

/// Careers Screen
class CareersScreen extends StatelessWidget {
  const CareersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DesignTokens.backgroundPrimary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => context.pop(),
        ),
        title: const Text('Carrières'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(DesignTokens.spaceLG),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Text(
                'Rejoignez l\'équipe EatFast',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  fontWeight: DesignTokens.fontWeightBold,
                ),
              ),
              
              const SizedBox(height: DesignTokens.spaceXS),
              
              Text(
                'Participez à la révolution culinaire au Cameroun',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: DesignTokens.textSecondary,
                ),
              ),
              
              const SizedBox(height: DesignTokens.spaceXXL),
              
              // Job Openings
              Text(
                'Postes disponibles',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: DesignTokens.fontWeightSemiBold,
                ),
              ),
              
              const SizedBox(height: DesignTokens.spaceMD),
              
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _jobOpenings.length,
                itemBuilder: (context, index) {
                  final job = _jobOpenings[index];
                  return _buildJobCard(context, job);
                },
              ),
              
              const SizedBox(height: DesignTokens.spaceXXL),
              
              // Why Work With Us
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(DesignTokens.spaceLG),
                decoration: BoxDecoration(
                  color: DesignTokens.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(DesignTokens.radiusLG),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pourquoi nous rejoindre ?',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: DesignTokens.fontWeightSemiBold,
                        color: DesignTokens.primaryColor,
                      ),
                    ),
                    
                    const SizedBox(height: DesignTokens.spaceMD),
                    
                    ..._benefits.map((benefit) => _buildBenefitItem(context, benefit)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildJobCard(BuildContext context, JobOpening job) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: DesignTokens.spaceMD),
      child: Padding(
        padding: const EdgeInsets.all(DesignTokens.spaceLG),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(DesignTokens.spaceXS),
                  decoration: BoxDecoration(
                    color: DesignTokens.primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(DesignTokens.radiusSM),
                  ),
                  child: Icon(
                    job.icon,
                    color: DesignTokens.primaryColor,
                    size: DesignTokens.iconMD,
                  ),
                ),
                
                const SizedBox(width: DesignTokens.spaceMD),
                
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        job.title,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: DesignTokens.fontWeightSemiBold,
                        ),
                      ),
                      Text(
                        job.department,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: DesignTokens.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: DesignTokens.spaceXS,
                    vertical: DesignTokens.spaceXXS,
                  ),
                  decoration: BoxDecoration(
                    color: job.isRemote ? DesignTokens.infoColor : DesignTokens.warningColor,
                    borderRadius: BorderRadius.circular(DesignTokens.radiusSM),
                  ),
                  child: Text(
                    job.isRemote ? 'Remote' : 'Sur site',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: DesignTokens.white,
                      fontWeight: DesignTokens.fontWeightSemiBold,
                    ),
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: DesignTokens.spaceMD),
            
            Text(
              job.description,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: DesignTokens.textSecondary,
              ),
            ),
            
            const SizedBox(height: DesignTokens.spaceMD),
            
            Row(
              children: [
                const Icon(
                  Icons.schedule,
                  size: DesignTokens.iconSM,
                  color: DesignTokens.textSecondary,
                ),
                const SizedBox(width: DesignTokens.spaceXS),
                Text(
                  job.type,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: DesignTokens.textSecondary,
                  ),
                ),
                
                const SizedBox(width: DesignTokens.spaceMD),
                
                const Icon(
                  Icons.location_on,
                  size: DesignTokens.iconSM,
                  color: DesignTokens.textSecondary,
                ),
                const SizedBox(width: DesignTokens.spaceXS),
                Text(
                  job.location,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: DesignTokens.textSecondary,
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: DesignTokens.spaceMD),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => _showJobDetails(context, job),
                  child: const Text('Voir les détails'),
                ),
                
                const SizedBox(width: DesignTokens.spaceSM),
                
                ElevatedButton(
                  onPressed: () => _applyForJob(context, job),
                  child: const Text('Postuler'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBenefitItem(BuildContext context, String benefit) {
    return Padding(
      padding: const EdgeInsets.only(bottom: DesignTokens.spaceXS),
      child: Row(
        children: [
          const Icon(
            Icons.check_circle,
            color: DesignTokens.successColor,
            size: DesignTokens.iconSM,
          ),
          const SizedBox(width: DesignTokens.spaceXS),
          Expanded(
            child: Text(
              benefit,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }

  void _showJobDetails(BuildContext context, JobOpening job) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.8,
        padding: const EdgeInsets.all(DesignTokens.spaceLG),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    job.title,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: DesignTokens.fontWeightBold,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            
            const SizedBox(height: DesignTokens.spaceMD),
            
            Text(
              'Description du poste',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: DesignTokens.fontWeightSemiBold,
              ),
            ),
            
            const SizedBox(height: DesignTokens.spaceXS),
            
            Text(job.description),
            
            const SizedBox(height: DesignTokens.spaceMD),
            
            Text(
              'Responsabilités',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: DesignTokens.fontWeightSemiBold,
              ),
            ),
            
            const SizedBox(height: DesignTokens.spaceXS),
            
            ...job.responsibilities.map((responsibility) => Padding(
              padding: const EdgeInsets.only(bottom: DesignTokens.spaceXS),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('• ', style: TextStyle(fontSize: 16)),
                  Expanded(child: Text(responsibility)),
                ],
              ),
            )),
            
            const Spacer(),
            
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  _applyForJob(context, job);
                },
                child: const Text('Postuler maintenant'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _applyForJob(BuildContext context, JobOpening job) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Application en cours pour ${job.title}'),
        backgroundColor: DesignTokens.successColor,
      ),
    );
  }

  static final List<JobOpening> _jobOpenings = [
    JobOpening(
      title: 'Chef Cuisinier Senior',
      department: 'Cuisine',
      description: 'Nous recherchons un chef expérimenté pour superviser notre équipe culinaire et créer des plats exceptionnels.',
      type: 'Temps plein',
      location: 'Yaoundé',
      isRemote: false,
      icon: Icons.restaurant,
      responsibilities: [
        'Superviser la préparation des plats',
        'Former les cuisiniers juniors',
        'Maintenir les standards de qualité',
        'Gérer l\'inventaire des ingrédients',
      ],
    ),
    JobOpening(
      title: 'Livreur',
      department: 'Logistique',
      description: 'Rejoignez notre équipe de livraison pour apporter la joie culinaire directement chez nos clients.',
      type: 'Temps partiel',
      location: 'Yaoundé',
      isRemote: false,
      icon: Icons.delivery_dining,
      responsibilities: [
        'Livrer les commandes en temps et en heure',
        'Maintenir une communication courtoise',
        'Respecter les consignes de sécurité',
        'Gérer les paiements à la livraison',
      ],
    ),
    JobOpening(
      title: 'Développeur Mobile',
      department: 'Technologie',
      description: 'Participez au développement de notre application mobile et améliorez l\'expérience utilisateur.',
      type: 'Temps plein',
      location: 'Remote/Yaoundé',
      isRemote: true,
      icon: Icons.phone_android,
      responsibilities: [
        'Développer des fonctionnalités mobiles',
        'Optimiser les performances de l\'app',
        'Collaborer avec l\'équipe design',
        'Maintenir la qualité du code',
      ],
    ),
  ];

  static final List<String> _benefits = [
    'Salaire compétitif et primes de performance',
    'Assurance maladie complète',
    'Formation continue et développement professionnel',
    'Environnement de travail dynamique et inclusif',
    'Repas gratuits pendant les heures de travail',
    'Opportunités d\'évolution de carrière',
  ];
}

class JobOpening {
  final String title;
  final String department;
  final String description;
  final String type;
  final String location;
  final bool isRemote;
  final IconData icon;
  final List<String> responsibilities;

  JobOpening({
    required this.title,
    required this.department,
    required this.description,
    required this.type,
    required this.location,
    required this.isRemote,
    required this.icon,
    required this.responsibilities,
  });
}
