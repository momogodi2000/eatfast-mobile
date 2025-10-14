/// Wallet & Financials Screen
/// Displays wallet balance, transactions, and financial operations
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/design_tokens.dart';
import '../../../../shared/widgets/loading/app_loading_indicator.dart';
import '../../providers/restaurant_owner_provider.dart';
import '../widgets/restaurant_manager_drawer.dart';

class WalletFinancialsScreen extends ConsumerStatefulWidget {
  final String restaurantId;

  const WalletFinancialsScreen({
    super.key,
    required this.restaurantId,
  });

  @override
  ConsumerState<WalletFinancialsScreen> createState() => _WalletFinancialsScreenState();
}

class _WalletFinancialsScreenState extends ConsumerState<WalletFinancialsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isLoading = false;
  double _balance = 0.0;
  double _pendingAmount = 0.0;
  double _totalEarnings = 0.0;
  List<Map<String, dynamic>> _transactions = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _loadWalletData();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _loadWalletData() async {
    setState(() => _isLoading = true);

    // Load wallet balance
    final balanceResult = await ref
        .read(restaurantOwnerProvider(widget.restaurantId).notifier)
        .getWalletBalance();

    balanceResult.when(
      success: (data) {
        if (mounted) {
          setState(() {
            _balance = (data['available_balance'] as num?)?.toDouble() ?? 0.0;
            _pendingAmount = (data['pending_balance'] as num?)?.toDouble() ?? 0.0;
            _totalEarnings = (data['total_earnings'] as num?)?.toDouble() ?? 0.0;
          });
        }
      },
      failure: (error) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Erreur de chargement du solde: $error'),
              backgroundColor: DesignTokens.errorColor,
            ),
          );
        }
      },
    );

    // Load transactions
    final transactionsResult = await ref
        .read(restaurantOwnerProvider(widget.restaurantId).notifier)
        .getWalletTransactions();

    transactionsResult.when(
      success: (data) {
        if (mounted) {
          setState(() {
            _transactions = data;
          });
        }
      },
      failure: (error) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Erreur de chargement des transactions: $error'),
              backgroundColor: DesignTokens.errorColor,
            ),
          );
        }
      },
    );

    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DesignTokens.backgroundGrey,
      drawer: RestaurantManagerDrawer(restaurantId: widget.restaurantId),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            expandedHeight: 280,
            floating: false,
            pinned: true,
            backgroundColor: DesignTokens.primaryColor,
            flexibleSpace: FlexibleSpaceBar(
              background: _buildWalletHeader(),
            ),
            bottom: TabBar(
              controller: _tabController,
              indicatorColor: DesignTokens.white,
              labelColor: DesignTokens.white,
              unselectedLabelColor: DesignTokens.white.withValues(alpha: 0.7),
              tabs: const [
                Tab(icon: Icon(Icons.receipt_long), text: 'Transactions'),
                Tab(icon: Icon(Icons.trending_up), text: 'Revenus'),
                Tab(icon: Icon(Icons.account_balance), text: 'Retraits'),
              ],
            ),
          ),
        ],
        body: _isLoading
            ? const Center(child: AppLoadingIndicator())
            : TabBarView(
                controller: _tabController,
                children: [
                  _buildTransactionsTab(),
                  _buildRevenueTab(),
                  _buildWithdrawalsTab(),
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'wallet_financials_fab',
        onPressed: _showWithdrawDialog,
        icon: const Icon(Icons.account_balance_wallet),
        label: const Text('Retirer'),
        backgroundColor: DesignTokens.successColor,
      ),
    );
  }

  Widget _buildWalletHeader() {
    return Container(
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
          padding: const EdgeInsets.all(DesignTokens.spaceLG),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40), // Space for back button
              const Text(
                'Solde Disponible',
                style: TextStyle(
                  color: DesignTokens.white,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    '${_balance.toStringAsFixed(0)} FCFA',
                    style: const TextStyle(
                      color: DesignTokens.white,
                      fontSize: 36,
                      fontWeight: DesignTokens.fontWeightBold,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: _loadWalletData,
                    icon: const Icon(Icons.refresh, color: DesignTokens.white),
                  ),
                ],
              ),
              const SizedBox(height: DesignTokens.spaceLG),
              Row(
                children: [
                  Expanded(
                    child: _buildBalanceCard(
                      title: 'En Attente',
                      amount: _pendingAmount,
                      icon: Icons.hourglass_empty,
                    ),
                  ),
                  const SizedBox(width: DesignTokens.spaceMD),
                  Expanded(
                    child: _buildBalanceCard(
                      title: 'Total Gagné',
                      amount: _totalEarnings,
                      icon: Icons.monetization_on,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBalanceCard({
    required String title,
    required double amount,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.all(DesignTokens.spaceMD),
      decoration: BoxDecoration(
        color: DesignTokens.white.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: DesignTokens.white, size: 24),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              color: DesignTokens.white,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '${amount.toStringAsFixed(0)} FCFA',
            style: const TextStyle(
              color: DesignTokens.white,
              fontSize: 18,
              fontWeight: DesignTokens.fontWeightBold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionsTab() {
    if (_transactions.isEmpty) {
      return RefreshIndicator(
        onRefresh: _loadWalletData,
        child: ListView(
          padding: const EdgeInsets.all(DesignTokens.spaceXL),
          children: [
            const SizedBox(height: 100),
            const Icon(Icons.account_balance_wallet_outlined, size: 80, color: DesignTokens.textTertiary),
            const SizedBox(height: DesignTokens.spaceLG),
            Text(
              'Aucune transaction',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(color: DesignTokens.textSecondary),
            ),
            const SizedBox(height: DesignTokens.spaceSM),
            Text(
              'Vos transactions apparaîtront ici',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: DesignTokens.textTertiary),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _loadWalletData,
      child: ListView.builder(
        padding: const EdgeInsets.all(DesignTokens.spaceMD),
        itemCount: _transactions.length,
        itemBuilder: (context, index) {
          final transaction = _transactions[index];
          return _buildTransactionCard(transaction);
        },
      ),
    );
  }

  Widget _buildRevenueTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(DesignTokens.spaceMD),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('Résumé des Revenus'),
          const SizedBox(height: DesignTokens.spaceMD),
          _buildRevenueCards(),
          const SizedBox(height: DesignTokens.spaceXL),

          _buildSectionTitle('Revenus par Période'),
          const SizedBox(height: DesignTokens.spaceMD),
          _buildPeriodRevenueCards(),
          const SizedBox(height: DesignTokens.spaceXL),

          _buildSectionTitle('Détails des Commissions'),
          const SizedBox(height: DesignTokens.spaceMD),
          _buildCommissionCard(),
        ],
      ),
    );
  }

  Widget _buildWithdrawalsTab() {
    // TODO: Replace with real withdrawal history from backend
    final withdrawals = [
      {
        'amount': '50,000',
        'date': 'Hier, 10:00',
        'destination': 'MTN Mobile Money',
        'status': 'completed',
        'statusText': 'Complété',
      },
      {
        'amount': '100,000',
        'date': 'Il y a 3 jours',
        'destination': 'Orange Money',
        'status': 'pending',
        'statusText': 'En cours',
      },
      {
        'amount': '75,000',
        'date': 'Il y a 1 semaine',
        'destination': 'MTN Mobile Money',
        'status': 'completed',
        'statusText': 'Complété',
      },
    ];

    return ListView(
      padding: const EdgeInsets.all(DesignTokens.spaceMD),
      children: [
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
          ),
          child: Padding(
            padding: const EdgeInsets.all(DesignTokens.spaceMD),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Informations de Retrait',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: DesignTokens.fontWeightBold,
                  ),
                ),
                const SizedBox(height: DesignTokens.spaceMD),
                _buildInfoRow('Montant Minimum', '10,000 FCFA'),
                const Divider(),
                _buildInfoRow('Frais de Retrait', '2.5%'),
                const Divider(),
                _buildInfoRow('Délai de Traitement', '24-48 heures'),
              ],
            ),
          ),
        ),
        const SizedBox(height: DesignTokens.spaceLG),
        _buildSectionTitle('Historique des Retraits'),
        const SizedBox(height: DesignTokens.spaceMD),
        ...withdrawals.map((withdrawal) => _buildWithdrawalCard(withdrawal)),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: DesignTokens.fontWeightBold,
            color: DesignTokens.textPrimary,
          ),
    );
  }

  Widget _buildTransactionCard(Map<String, dynamic> transaction) {
    final isCredit = transaction['type'] == 'credit';
    final color = isCredit ? DesignTokens.successColor : DesignTokens.errorColor;

    return Card(
      margin: const EdgeInsets.only(bottom: DesignTokens.spaceMD),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            isCredit ? Icons.arrow_downward : Icons.arrow_upward,
            color: color,
          ),
        ),
        title: Text(transaction['description']),
        subtitle: Text(transaction['date']),
        trailing: Text(
          '${isCredit ? '+' : '-'}${transaction['amount']} FCFA',
          style: TextStyle(
            fontSize: 16,
            fontWeight: DesignTokens.fontWeightBold,
            color: color,
          ),
        ),
      ),
    );
  }

  Widget _buildRevenueCards() {
    return Row(
      children: [
        Expanded(
          child: _buildMetricCard(
            title: 'Aujourd\'hui',
            value: '45,000',
            subtitle: '+12% vs hier',
            color: DesignTokens.successColor,
            icon: Icons.today,
          ),
        ),
        const SizedBox(width: DesignTokens.spaceMD),
        Expanded(
          child: _buildMetricCard(
            title: 'Cette Semaine',
            value: '285,000',
            subtitle: '+8% vs sem. dernière',
            color: DesignTokens.primaryColor,
            icon: Icons.calendar_view_week,
          ),
        ),
      ],
    );
  }

  Widget _buildPeriodRevenueCards() {
    return Column(
      children: [
        _buildPeriodCard('Ce Mois', '1,125,000', Colors.blue),
        const SizedBox(height: DesignTokens.spaceMD),
        _buildPeriodCard('Mois Dernier', '950,000', Colors.purple),
        const SizedBox(height: DesignTokens.spaceMD),
        _buildPeriodCard('Cette Année', '8,450,000', Colors.orange),
      ],
    );
  }

  Widget _buildMetricCard({
    required String title,
    required String value,
    required String subtitle,
    required Color color,
    required IconData icon,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
      ),
      child: Padding(
        padding: const EdgeInsets.all(DesignTokens.spaceMD),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 32),
            const SizedBox(height: DesignTokens.spaceSM),
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                color: DesignTokens.textSecondary,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '$value FCFA',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: DesignTokens.fontWeightBold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 11,
                color: DesignTokens.successColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPeriodCard(String period, String amount, Color color) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.bar_chart, color: color),
        ),
        title: Text(period),
        trailing: Text(
          '$amount FCFA',
          style: TextStyle(
            fontSize: 18,
            fontWeight: DesignTokens.fontWeightBold,
            color: color,
          ),
        ),
      ),
    );
  }

  Widget _buildCommissionCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
      ),
      child: Padding(
        padding: const EdgeInsets.all(DesignTokens.spaceMD),
        child: Column(
          children: [
            _buildInfoRow('Revenus Bruts', '1,250,000 FCFA'),
            const Divider(),
            _buildInfoRow('Commission Plateforme (15%)', '-187,500 FCFA'),
            const Divider(),
            _buildInfoRow('Frais de Transaction', '-12,500 FCFA'),
            const Divider(),
            _buildInfoRow(
              'Revenus Nets',
              '1,050,000 FCFA',
              isTotal: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: DesignTokens.spaceSM),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: isTotal ? 16 : 14,
              fontWeight: isTotal ? DesignTokens.fontWeightBold : DesignTokens.fontWeightNormal,
              color: isTotal ? DesignTokens.textPrimary : DesignTokens.textSecondary,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: isTotal ? 18 : 14,
              fontWeight: DesignTokens.fontWeightBold,
              color: isTotal ? DesignTokens.successColor : DesignTokens.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWithdrawalCard(Map<String, dynamic> withdrawal) {
    Color statusColor;
    switch (withdrawal['status']) {
      case 'completed':
        statusColor = DesignTokens.successColor;
        break;
      case 'pending':
        statusColor = DesignTokens.warningColor;
        break;
      case 'failed':
        statusColor = DesignTokens.errorColor;
        break;
      default:
        statusColor = DesignTokens.textSecondary;
    }

    return Card(
      margin: const EdgeInsets.only(bottom: DesignTokens.spaceMD),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
      ),
      child: Padding(
        padding: const EdgeInsets.all(DesignTokens.spaceMD),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${withdrawal['amount']} FCFA',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: DesignTokens.fontWeightBold,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: statusColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(DesignTokens.radiusSM),
                  ),
                  child: Text(
                    withdrawal['statusText'],
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: DesignTokens.fontWeightBold,
                      color: statusColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: DesignTokens.spaceSM),
            Text(
              withdrawal['date'],
              style: TextStyle(
                fontSize: 14,
                color: DesignTokens.textSecondary,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Vers: ${withdrawal['destination']}',
              style: TextStyle(
                fontSize: 14,
                color: DesignTokens.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showWithdrawDialog() {
    final amountController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Retirer des Fonds'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Solde disponible: ${_balance.toStringAsFixed(0)} FCFA',
              style: TextStyle(
                color: DesignTokens.textSecondary,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: DesignTokens.spaceMD),
            TextField(
              controller: amountController,
              decoration: const InputDecoration(
                labelText: 'Montant à retirer (FCFA)',
                prefixIcon: Icon(Icons.monetization_on),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: DesignTokens.spaceMD),
            Text(
              'Frais: 2.5% du montant',
              style: TextStyle(
                color: DesignTokens.textTertiary,
                fontSize: 12,
              ),
            ),
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
              _processWithdrawal(amountController.text);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: DesignTokens.successColor,
              foregroundColor: DesignTokens.white,
            ),
            child: const Text('Retirer'),
          ),
        ],
      ),
    );
  }

  Future<void> _processWithdrawal(String amount) async {
    if (amount.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Veuillez entrer un montant'),
          backgroundColor: DesignTokens.warningColor,
        ),
      );
      return;
    }

    final withdrawalAmount = double.tryParse(amount);
    if (withdrawalAmount == null || withdrawalAmount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Montant invalide'),
          backgroundColor: DesignTokens.warningColor,
        ),
      );
      return;
    }

    if (withdrawalAmount > _balance) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Solde insuffisant'),
          backgroundColor: DesignTokens.errorColor,
        ),
      );
      return;
    }

    if (withdrawalAmount < 10000) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Le montant minimum de retrait est de 10,000 FCFA'),
          backgroundColor: DesignTokens.warningColor,
        ),
      );
      return;
    }

    final result = await ref
        .read(restaurantOwnerProvider(widget.restaurantId).notifier)
        .requestWithdrawal(withdrawalAmount, 'Demande de retrait');

    result.when(
      success: (_) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Demande de retrait envoyée. Traitement dans 24-48h'),
            backgroundColor: DesignTokens.successColor,
          ),
        );
        _loadWalletData(); // Refresh data
      },
      failure: (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erreur: $error'),
            backgroundColor: DesignTokens.errorColor,
          ),
        );
      },
    );
  }

  // Note: Mock data methods removed - now using real backend API
  // Backend endpoints: /restaurant/wallet, /restaurant/wallet/transactions, /restaurant/wallet/withdraw
}
