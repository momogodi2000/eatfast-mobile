import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/loyalty_provider.dart';
import '../../domain/models/loyalty.dart';
import 'package:intl/intl.dart';

class LoyaltyHistoryScreen extends ConsumerStatefulWidget {
  const LoyaltyHistoryScreen({super.key});

  @override
  ConsumerState<LoyaltyHistoryScreen> createState() => _LoyaltyHistoryScreenState();
}

class _LoyaltyHistoryScreenState extends ConsumerState<LoyaltyHistoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  LoyaltyTransactionType? _selectedFilter;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(loyaltyProvider.notifier).loadTransactionHistory();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loyaltyState = ref.watch(loyaltyProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Historique de Fidélité'),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white.withValues(alpha: 0.7),
          indicatorColor: Colors.white,
          tabs: const [
            Tab(text: 'Toutes les Activités'),
            Tab(text: 'Statistiques'),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () => _showFilterDialog(),
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildTransactionsTab(loyaltyState),
          _buildStatisticsTab(loyaltyState),
        ],
      ),
    );
  }

  Widget _buildTransactionsTab(LoyaltyState loyaltyState) {
    final filteredTransactions = _selectedFilter != null
        ? loyaltyState.transactions.where((t) => t.type == _selectedFilter).toList()
        : loyaltyState.transactions;

    return RefreshIndicator(
      onRefresh: () => ref.read(loyaltyProvider.notifier).loadTransactionHistory(),
      child: Column(
        children: [
          // Active Filter
          if (_selectedFilter != null)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              child: Wrap(
                children: [
                  Chip(
                    label: Text(_selectedFilter!.displayName),
                    deleteIcon: const Icon(Icons.close, size: 16),
                    onDeleted: () {
                      setState(() {
                        _selectedFilter = null;
                      });
                    },
                  ),
                ],
              ),
            ),

          // Transactions List
          Expanded(
            child: loyaltyState.isLoadingTransactions
                ? _buildLoadingState()
                : filteredTransactions.isEmpty
                    ? _buildEmptyState()
                    : _buildTransactionsList(filteredTransactions, loyaltyState),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionsList(List<LoyaltyTransaction> transactions, LoyaltyState loyaltyState) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: transactions.length + (loyaltyState.transactionsPagination?.totalPages != null &&
              loyaltyState.transactionsPagination!.page < loyaltyState.transactionsPagination!.totalPages 
              ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == transactions.length) {
          return _buildLoadMoreButton();
        }

        final transaction = transactions[index];
        return _TransactionDetailTile(transaction: transaction);
      },
    );
  }

  Widget _buildLoadMoreButton() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: ElevatedButton(
        onPressed: () {
          ref.read(loyaltyProvider.notifier).loadTransactionHistory(
            loadMore: true,
            type: _selectedFilter,
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.white,
        ),
        child: const Text('Charger Plus'),
      ),
    );
  }

  Widget _buildStatisticsTab(LoyaltyState loyaltyState) {
    final transactions = loyaltyState.transactions;
    
    final earnedPoints = transactions
        .where((t) => t.type == LoyaltyTransactionType.earned)
        .fold<int>(0, (sum, t) => sum + t.points);
    
    final redeemedPoints = transactions
        .where((t) => t.type == LoyaltyTransactionType.redeemed)
        .fold<int>(0, (sum, t) => sum + t.points);
    
    final bonusPoints = transactions
        .where((t) => t.type == LoyaltyTransactionType.bonus)
        .fold<int>(0, (sum, t) => sum + t.points);

    final thisMonthTransactions = transactions
        .where((t) => t.createdAt.month == DateTime.now().month &&
                     t.createdAt.year == DateTime.now().year)
        .toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Points Summary Cards
          Row(
            children: [
              Expanded(
                child: _StatCard(
                  title: 'Points Gagnés',
                  value: earnedPoints.toString(),
                  color: Colors.green,
                  icon: Icons.add_circle,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _StatCard(
                  title: 'Points Utilisés',
                  value: redeemedPoints.toString(),
                  color: Colors.blue,
                  icon: Icons.redeem,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _StatCard(
                  title: 'Points Bonus',
                  value: bonusPoints.toString(),
                  color: Colors.orange,
                  icon: Icons.card_giftcard,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _StatCard(
                  title: 'Ce Mois',
                  value: thisMonthTransactions.length.toString(),
                  color: Colors.purple,
                  icon: Icons.calendar_month,
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // Monthly Activity Chart
          Text(
            'Activité par Type',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _buildActivityByTypeChart(transactions),

          const SizedBox(height: 24),

          // Recent Activity Summary
          Text(
            'Résumé Récent',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _buildRecentActivitySummary(transactions),
        ],
      ),
    );
  }

  Widget _buildActivityByTypeChart(List<LoyaltyTransaction> transactions) {
    final Map<LoyaltyTransactionType, int> typeCounts = {};
    
    for (final transaction in transactions) {
      typeCounts[transaction.type] = (typeCounts[transaction.type] ?? 0) + 1;
    }

    if (typeCounts.isEmpty) {
      return Container(
        height: 200,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Center(
          child: Text('Aucune donnée disponible'),
        ),
      );
    }

    final totalTransactions = typeCounts.values.fold<int>(0, (sum, count) => sum + count);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        children: typeCounts.entries.map((entry) {
          final percentage = (entry.value / totalTransactions * 100);
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: _getTypeColor(entry.key),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    entry.key.displayName,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Text(
                  '${entry.value} (${percentage.toStringAsFixed(1)}%)',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildRecentActivitySummary(List<LoyaltyTransaction> transactions) {
    final recentTransactions = transactions.take(5).toList();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        children: recentTransactions.map((transaction) => _SummaryTransactionTile(
          transaction: transaction,
        )).toList(),
      ),
    );
  }

  Widget _buildLoadingState() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.receipt_long,
              size: 64,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              'Aucune Transaction',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Vos transactions de fidélité apparaîtront ici',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.grey[500],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Filtrer par Type'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile<LoyaltyTransactionType?>(
                title: const Text('Toutes les transactions'),
                value: null,
                groupValue: _selectedFilter,
                onChanged: (value) {
                  setState(() {
                    _selectedFilter = value;
                  });
                  Navigator.of(context).pop();
                },
              ),
              ...LoyaltyTransactionType.values.map((type) => RadioListTile<LoyaltyTransactionType?>(
                title: Text(type.displayName),
                value: type,
                groupValue: _selectedFilter,
                onChanged: (value) {
                  setState(() {
                    _selectedFilter = value;
                  });
                  Navigator.of(context).pop();
                },
              )),
            ],
          ),
        );
      },
    );
  }

  Color _getTypeColor(LoyaltyTransactionType type) {
    switch (type) {
      case LoyaltyTransactionType.earned:
        return Colors.green;
      case LoyaltyTransactionType.redeemed:
        return Colors.blue;
      case LoyaltyTransactionType.expired:
        return Colors.red;
      case LoyaltyTransactionType.bonus:
        return Colors.orange;
      case LoyaltyTransactionType.referral:
        return Colors.purple;
    }
  }
}

class _TransactionDetailTile extends StatelessWidget {
  final LoyaltyTransaction transaction;

  const _TransactionDetailTile({required this.transaction});

  @override
  Widget build(BuildContext context) {
    final isPositive = transaction.type == LoyaltyTransactionType.earned ||
                       transaction.type == LoyaltyTransactionType.bonus ||
                       transaction.type == LoyaltyTransactionType.referral;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 8,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: _getTransactionColor().withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Center(
                  child: Icon(
                    _getTransactionIcon(),
                    size: 24,
                    color: _getTransactionColor(),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaction.type.displayName,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      transaction.description,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.grey[600],
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${isPositive ? '+' : ''}${transaction.points}',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: isPositive ? Colors.green[600] : Colors.red[600],
                    ),
                  ),
                  Text(
                    'points',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.grey[500],
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Divider(height: 1, color: Colors.grey[200]),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'ID: ${transaction.id.substring(0, 8)}...',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.grey[500],
                  fontFamily: 'monospace',
                ),
              ),
              Text(
                DateFormat('dd/MM/yyyy HH:mm').format(transaction.createdAt),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
          if (transaction.orderId != null) ...[
            const SizedBox(height: 4),
            Text(
              'Commande: ${transaction.orderId}',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.grey[500],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Color _getTransactionColor() {
    switch (transaction.type) {
      case LoyaltyTransactionType.earned:
        return Colors.green;
      case LoyaltyTransactionType.redeemed:
        return Colors.blue;
      case LoyaltyTransactionType.expired:
        return Colors.red;
      case LoyaltyTransactionType.bonus:
        return Colors.orange;
      case LoyaltyTransactionType.referral:
        return Colors.purple;
    }
  }

  IconData _getTransactionIcon() {
    switch (transaction.type) {
      case LoyaltyTransactionType.earned:
        return Icons.add_circle;
      case LoyaltyTransactionType.redeemed:
        return Icons.redeem;
      case LoyaltyTransactionType.expired:
        return Icons.timer_off;
      case LoyaltyTransactionType.bonus:
        return Icons.card_giftcard;
      case LoyaltyTransactionType.referral:
        return Icons.people;
    }
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;
  final IconData icon;

  const _StatCard({
    required this.title,
    required this.value,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 8,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  icon,
                  size: 18,
                  color: color,
                ),
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}

class _SummaryTransactionTile extends StatelessWidget {
  final LoyaltyTransaction transaction;

  const _SummaryTransactionTile({required this.transaction});

  @override
  Widget build(BuildContext context) {
    final isPositive = transaction.type == LoyaltyTransactionType.earned ||
                       transaction.type == LoyaltyTransactionType.bonus ||
                       transaction.type == LoyaltyTransactionType.referral;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: _getTransactionColor(),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.type.displayName,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  DateFormat('dd/MM/yyyy').format(transaction.createdAt),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          Text(
            '${isPositive ? '+' : ''}${transaction.points}',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: isPositive ? Colors.green[600] : Colors.red[600],
            ),
          ),
        ],
      ),
    );
  }

  Color _getTransactionColor() {
    switch (transaction.type) {
      case LoyaltyTransactionType.earned:
        return Colors.green;
      case LoyaltyTransactionType.redeemed:
        return Colors.blue;
      case LoyaltyTransactionType.expired:
        return Colors.red;
      case LoyaltyTransactionType.bonus:
        return Colors.orange;
      case LoyaltyTransactionType.referral:
        return Colors.purple;
    }
  }
}