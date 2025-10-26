import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eatfast_mobile/shared/services/wallet/providers/wallet_provider.dart';
import 'package:eatfast_mobile/shared/services/wallet/domain/models/wallet.dart';
import '../widgets/transaction_list.dart';

class TransactionHistoryScreen extends ConsumerStatefulWidget {
  const TransactionHistoryScreen({super.key});

  @override
  ConsumerState<TransactionHistoryScreen> createState() =>
      _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState
    extends ConsumerState<TransactionHistoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();

  TransactionType? _currentFilter;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
    _scrollController.addListener(_onScroll);

    // Load initial transactions
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(walletProvider.notifier).loadTransactionHistory();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      // Pagination can be added here later if needed
    }
  }

  void _onFilterChanged(TransactionType? filter) {
    setState(() {
      _currentFilter = filter;
    });
    ref.read(walletProvider.notifier).loadTransactionHistory(type: filter);
  }

  @override
  Widget build(BuildContext context) {
    final walletAsyncValue = ref.watch(walletProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Historique des Transactions'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          onTap: (index) {
            final filters = [
              null,
              TransactionType.topup,
              TransactionType.payment,
              TransactionType.refund,
              TransactionType.bonus,
              TransactionType.transfer,
            ];
            _onFilterChanged(filters[index]);
          },
          tabs: const [
            Tab(text: 'Tout'),
            Tab(text: 'Recharges'),
            Tab(text: 'Paiements'),
            Tab(text: 'Remboursements'),
            Tab(text: 'Bonus'),
            Tab(text: 'Transferts'),
          ],
        ),
      ),
      body: walletAsyncValue.when(
        data: (wallet) => _buildWalletContent(context, wallet),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => _buildErrorView(context, error),
      ),
    );
  }

  Widget _buildWalletContent(BuildContext context, Wallet? wallet) {
    if (wallet == null) {
      return const Center(
        child: Text('Aucun portefeuille disponible'),
      );
    }

    // Filter transactions based on current filter
    final transactions = _currentFilter == null
        ? wallet.recentTransactions
        : wallet.recentTransactions
            .where((t) => t.type == _currentFilter)
            .toList();

    return RefreshIndicator(
      onRefresh: () =>
          ref.read(walletProvider.notifier).loadTransactionHistory(type: _currentFilter),
      child: Column(
        children: [
          // Summary Card
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
                  Theme.of(context).colorScheme.primary.withValues(alpha: 0.05),
                ],
              ),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.2),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _SummaryItem(
                  title: 'Solde Actuel',
                  value: '${wallet.balance.toStringAsFixed(0)} XAF',
                  icon: Icons.account_balance_wallet,
                  color: Theme.of(context).colorScheme.primary,
                ),
                Container(width: 1, height: 40, color: Colors.grey[300]),
                _SummaryItem(
                  title: 'Transactions',
                  value: transactions.length.toString(),
                  icon: Icons.receipt_long,
                  color: Colors.blue,
                ),
              ],
            ),
          ),

          // Transactions List
          Expanded(
            child: transactions.isEmpty
                ? Center(
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
                          'Aucune transaction trouvée',
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(color: Colors.grey[600]),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          _getEmptyMessage(_currentFilter),
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(color: Colors.grey[500]),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: transactions.length,
                    itemBuilder: (context, index) {
                      return TransactionTile(
                        transaction: transactions[index],
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorView(BuildContext context, Object error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 64, color: Colors.red[400]),
          const SizedBox(height: 16),
          Text(
            'Erreur de chargement',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              error.toString(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium
                  ?.copyWith(color: Colors.grey[600]),
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () => ref.read(walletProvider.notifier).loadTransactionHistory(),
            icon: const Icon(Icons.refresh),
            label: const Text('Réessayer'),
          ),
        ],
      ),
    );
  }

  String _getEmptyMessage(TransactionType? filter) {
    if (filter == null) {
      return 'Votre historique de transactions apparaîtra ici';
    }
    return 'Aucune transaction de type "${filter.displayName}" trouvée';
  }
}

class _SummaryItem extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _SummaryItem({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 32, color: color),
        const SizedBox(height: 8),
        Text(
          title,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.grey[600],
              ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: color,
              ),
        ),
      ],
    );
  }
}
