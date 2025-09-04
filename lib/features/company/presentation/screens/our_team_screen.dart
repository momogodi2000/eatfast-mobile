import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/router/route_names.dart';
import '../../../../core/theme/design_tokens.dart';

/// Our Team Screen
class OurTeamScreen extends StatelessWidget {
  const OurTeamScreen({super.key});

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
        title: const Text('Notre Équipe'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(DesignTokens.spaceLG),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Text(
                'Rencontrez notre équipe',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  fontWeight: DesignTokens.fontWeightBold,
                ),
              ),
              
              const SizedBox(height: DesignTokens.spaceXS),
              
              Text(
                'Des passionnés dédiés à vous offrir la meilleure expérience culinaire',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: DesignTokens.textSecondary,
                ),
              ),
              
              const SizedBox(height: DesignTokens.spaceXXL),
              
              // Team Members
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: DesignTokens.spaceMD,
                  mainAxisSpacing: DesignTokens.spaceMD,
                  childAspectRatio: 0.8,
                ),
                itemCount: _teamMembers.length,
                itemBuilder: (context, index) {
                  final member = _teamMembers[index];
                  return _buildTeamMemberCard(context, member);
                },
              ),
              
              const SizedBox(height: DesignTokens.spaceXXL),
              
              // Join Us Section
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(DesignTokens.spaceLG),
                decoration: BoxDecoration(
                  color: DesignTokens.primaryColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(DesignTokens.radiusLG),
                ),
                child: Column(
                  children: [
                    Text(
                      'Rejoignez notre équipe !',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: DesignTokens.fontWeightBold,
                        color: DesignTokens.primaryColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    
                    const SizedBox(height: DesignTokens.spaceXS),
                    
                    Text(
                      'Nous recrutons constamment des talents pour rejoindre notre aventure culinaire.',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: DesignTokens.textSecondary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    
                    const SizedBox(height: DesignTokens.spaceMD),
                    
                    ElevatedButton(
                      onPressed: () => context.go(RouteNames.careers),
                      child: const Text('Voir les offres d\'emploi'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTeamMemberCard(BuildContext context, TeamMember member) {
    return Card(
      elevation: 2,
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: DesignTokens.lightGrey.withValues(alpha: 0.3),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(DesignTokens.radiusMD),
                  topRight: Radius.circular(DesignTokens.radiusMD),
                ),
              ),
              child: Center(
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: DesignTokens.primaryColor.withValues(alpha: 0.1),
                  child: Text(
                    member.initials,
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontWeight: DesignTokens.fontWeightBold,
                      color: DesignTokens.primaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.all(DesignTokens.spaceMD),
            child: Column(
              children: [
                Text(
                  member.name,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: DesignTokens.fontWeightSemiBold,
                  ),
                  textAlign: TextAlign.center,
                ),
                
                const SizedBox(height: DesignTokens.spaceXS),
                
                Text(
                  member.position,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: DesignTokens.primaryColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static final List<TeamMember> _teamMembers = [
    TeamMember(
      name: 'Marie Nguemeni',
      position: 'Fondatrice & CEO',
      initials: 'MN',
    ),
    TeamMember(
      name: 'Paul Mbarga',
      position: 'Chef Cuisinier',
      initials: 'PM',
    ),
    TeamMember(
      name: 'Fatima Alhadji',
      position: 'Responsable Qualité',
      initials: 'FA',
    ),
    TeamMember(
      name: 'Jean Takam',
      position: 'Directeur Logistique',
      initials: 'JT',
    ),
    TeamMember(
      name: 'Aminata Sow',
      position: 'Community Manager',
      initials: 'AS',
    ),
    TeamMember(
      name: 'David Tchoumba',
      position: 'Développeur Tech',
      initials: 'DT',
    ),
  ];
}

class TeamMember {
  final String name;
  final String position;
  final String initials;

  TeamMember({
    required this.name,
    required this.position,
    required this.initials,
  });
}
