import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eatfast_mobile/shared/services/subscription/domain/models/subscription.dart';
import '../providers/subscription_provider.dart';
import '../widgets/subscription_plan_card.dart';
import '../widgets/subscription_benefits_list.dart';
import '../widgets/billing_history_widget.dart';
import '../widgets/subscription_usage_widget.dart';
import 'package:eatfast_mobile/shared/widgets/common/loading_widget.dart';
import 'package:eatfast_mobile/shared/widgets/common/error_display_widget.dart';

class SubscriptionManagementScreen extends ConsumerStatefulWidget {
  const SubscriptionManagementScreen({super.key});

  @override
  ConsumerState<SubscriptionManagementScreen> createState() => _SubscriptionManagementScreenState();
}

class _SubscriptionManagementScreenState extends ConsumerState<SubscriptionManagementScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userSubscriptionAsync = ref.watch(userSubscriptionProvider);
    final availablePlansAsync = ref.watch(availableSubscriptionPlansProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Abonnements'),
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(
              icon: Icon(Icons.dashboard),
              text: 'Aper�u',
            ),
            Tab(
              icon: Icon(Icons.card_membership),
              text: 'Plans',
            ),
            Tab(
              icon: Icon(Icons.analytics),
              text: 'Usage',
            ),
            Tab(
              icon: Icon(Icons.receipt),
              text: 'Facturation',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildOverviewTab(userSubscriptionAsync),
          _buildPlansTab(availablePlansAsync, userSubscriptionAsync),
          _buildUsageTab(userSubscriptionAsync),
          _buildBillingTab(),
        ],
      ),
    );
  }

  Widget _buildOverviewTab(AsyncValue<UserSubscription?> userSubscriptionAsync) {
    return userSubscriptionAsync.when(
      data: (subscription) => RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(userSubscriptionProvider);
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Current subscription status
              _buildCurrentSubscriptionCard(subscription),
              const SizedBox(height: 24),

              // Quick actions
              _buildQuickActions(subscription),
              const SizedBox(height: 24),

              // Benefits overview
              if (subscription?.plan != null) ...[
                Text(
                  'Avantages inclus',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                if (subscription?.plan != null)
                  SubscriptionBenefitsList(
                    plan: subscription!.plan!,
                  ),
                const SizedBox(height: 24),
              ],

              // Upcoming renewal/expiry
              if (subscription != null)
                _buildRenewalCard(subscription),
            ],
          ),
        ),
      ),
      loading: () => const LoadingWidget(),
      error: (error, stack) => ErrorDisplayWidget(
        message: error.toString(),
        onRetry: () => ref.invalidate(userSubscriptionProvider),
      ),
    );
  }

  Widget _buildCurrentSubscriptionCard(UserSubscription? subscription) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: subscription?.isActive == true
                        ? Colors.green.withValues(alpha: 0.1)
                        : Colors.grey.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    subscription?.isActive == true
                        ? Icons.check_circle
                        : Icons.error_outline,
                    color: subscription?.isActive == true
                        ? Colors.green
                        : Colors.grey,
                    size: 32,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        subscription?.plan?.name ?? 'Aucun abonnement',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subscription?.isActive == true
                            ? 'Actif'
                            : 'Inactif',
                        style: TextStyle(
                          color: subscription?.isActive == true
                              ? Colors.green
                              : Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                if (subscription?.isActive == true && subscription?.plan != null)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.green.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      subscription!.plan!.type.toString().split('.').last,
                      style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                  ),
              ],
            ),
            if (subscription != null) ...[
              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Prix mensuel',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${subscription.plan?.price?.toStringAsFixed(0) ?? "0"} XAF',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Prochaine facturation',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          _formatDate(subscription.nextBillingDate),
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActions(UserSubscription? subscription) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Actions rapides',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            if (subscription?.isActive == true) ...[
              _buildActionTile(
                icon: Icons.upgrade,
                title: 'Changer de plan',
                subtitle: 'Passer � un plan sup�rieur',
                onTap: () => _tabController.animateTo(1),
              ),
              _buildActionTile(
                icon: Icons.pause_circle,
                title: 'Suspendre l\'abonnement',
                subtitle: 'Mettre en pause temporairement',
                onTap: () => _showPauseDialog(),
              ),
              _buildActionTile(
                icon: Icons.cancel,
                title: 'Annuler l\'abonnement',
                subtitle: 'R�silier � la fin de la p�riode',
                onTap: () => _showCancelDialog(),
                textColor: Colors.red,
              ),
            ] else ...[
              _buildActionTile(
                icon: Icons.add_circle,
                title: 'Souscrire � un plan',
                subtitle: 'Choisir un abonnement',
                onTap: () => _tabController.animateTo(1),
              ),
            ],
            _buildActionTile(
              icon: Icons.receipt_long,
              title: 'T�l�charger les factures',
              subtitle: 'Historique de facturation',
              onTap: () => _tabController.animateTo(3),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    Color? textColor,
  }) {
    return ListTile(
      leading: Icon(icon, color: textColor ?? Theme.of(context).primaryColor),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
      ),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }

  Widget _buildPlansTab(
    AsyncValue<List<SubscriptionPlan>> availablePlansAsync,
    AsyncValue<UserSubscription?> userSubscriptionAsync,
  ) {
    return availablePlansAsync.when(
      data: (plans) => RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(availableSubscriptionPlansProvider);
        },
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: plans.length,
          itemBuilder: (context, index) {
            final plan = plans[index];
            final userSubscription = userSubscriptionAsync.valueOrNull;
            final isCurrentPlan = userSubscription?.plan?.id == plan.id;

            return SubscriptionPlanCard(
              plan: plan,
              isCurrentPlan: isCurrentPlan,
              isUpgrade: userSubscription != null &&
                         userSubscription.plan != null &&
                         plan.price != null &&
                         userSubscription.plan!.price != null &&
                         plan.price! > userSubscription.plan!.price!,
              onSelectPlan: () => _handlePlanSelection(plan, userSubscription),
            );
          },
        ),
      ),
      loading: () => const LoadingWidget(),
      error: (error, stack) => ErrorDisplayWidget(
        message: error.toString(),
        onRetry: () => ref.invalidate(availableSubscriptionPlansProvider),
      ),
    );
  }

  Widget _buildUsageTab(AsyncValue<UserSubscription?> userSubscriptionAsync) {
    return userSubscriptionAsync.when(
      data: (subscription) {
        if (subscription == null) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.analytics_outlined,
                  size: 80,
                  color: Colors.grey,
                ),
                SizedBox(height: 16),
                Text(
                  'Aucun abonnement actif',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(userSubscriptionProvider);
          },
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: SubscriptionUsageWidget(
              subscription: subscription,
            ),
          ),
        );
      },
      loading: () => const LoadingWidget(),
      error: (error, stack) => ErrorDisplayWidget(
        message: error.toString(),
        onRetry: () => ref.invalidate(userSubscriptionProvider),
      ),
    );
  }

  Widget _buildBillingTab() {
    return const BillingHistoryWidget(
      billingHistory: [], // TODO: Get actual billing history
    );
  }

  Widget _buildRenewalCard(UserSubscription subscription) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.schedule,
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(width: 12),
                Text(
                  'Prochaine facturation',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              'Votre abonnement sera renouvel� le ${_formatDate(subscription.nextBillingDate)}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'Montant: ${subscription.plan?.price?.toStringAsFixed(0) ?? "0"} XAF',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handlePlanSelection(SubscriptionPlan plan, UserSubscription? currentSubscription) {
    if (currentSubscription?.plan?.id == plan.id) return;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Souscrire à ${plan.name ?? "Plan"}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (currentSubscription != null && currentSubscription.plan != null)
              Text('Vous allez passer de ${currentSubscription.plan!.name ?? "Plan actuel"} à ${plan.name ?? "nouveau plan"}.'),
            const SizedBox(height: 16),
            Text('Prix: ${plan.price?.toStringAsFixed(0) ?? "0"} XAF/mois'),
            const SizedBox(height: 8),
            Text('Facturation: ${plan.billingCycle}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _subscribeToPlan(plan);
            },
            child: const Text('Souscrire'),
          ),
        ],
      ),
    );
  }

  void _subscribeToPlan(SubscriptionPlan plan) async {
    try {
      await ref.read(subscriptionProvider.notifier).subscribeToPlan(plan.id);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Abonnement � ${plan.name} activ� avec succ�s !'),
            backgroundColor: Colors.green,
          ),
        );
        ref.invalidate(userSubscriptionProvider);
      }
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erreur: $error'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _showPauseDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Suspendre l\'abonnement'),
        content: const Text(
          'Votre abonnement sera suspendu et vous n\'aurez plus acc�s aux avantages premium. '
          'Vous pouvez le r�activer � tout moment.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _pauseSubscription();
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            child: const Text('Suspendre'),
          ),
        ],
      ),
    );
  }

  void _showCancelDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Annuler l\'abonnement'),
        content: const Text(
          'Votre abonnement sera annul� � la fin de la p�riode de facturation actuelle. '
          'Cette action est irr�versible.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Garder l\'abonnement'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _cancelSubscription();
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Annuler l\'abonnement'),
          ),
        ],
      ),
    );
  }

  void _pauseSubscription() async {
    try {
      await ref.read(subscriptionProvider.notifier).pauseSubscription();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Abonnement suspendu'),
            backgroundColor: Colors.orange,
          ),
        );
        ref.invalidate(userSubscriptionProvider);
      }
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erreur: $error'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _cancelSubscription() async {
    try {
      await ref.read(subscriptionProvider.notifier).cancelSubscription('User requested cancellation');

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Abonnement annul�'),
            backgroundColor: Colors.red,
          ),
        );
        ref.invalidate(userSubscriptionProvider);
      }
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erreur: $error'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  String _formatDate(DateTime? date) {
    if (date == null) return 'N/A';
    return '${date.day}/${date.month}/${date.year}';
  }
}
