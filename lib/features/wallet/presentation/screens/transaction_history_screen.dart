import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/wallet_provider.dart';
import '../../domain/models/wallet.dart';
import '../widgets/transaction_list.dart';

class TransactionHistoryScreen extends ConsumerStatefulWidget {
  const TransactionHistoryScreen({super.key});

  @override
  ConsumerState<TransactionHistoryScreen> createState() => _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends ConsumerState<TransactionHistoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();
  
  TransactionType? _currentFilter;
  bool _isLoadingMore = false;

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
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      _loadMore();
    }
  }

  Future<void> _loadMore() async {
    final walletState = ref.read(walletProvider);
    final pagination = walletState.transactionsPagination;
    
    if (pagination != null && 
        pagination.page < pagination.totalPages && 
        !_isLoadingMore) {
      setState(() {
        _isLoadingMore = true;
      });
      
      await ref.read(walletProvider.notifier).loadTransactionHistory(
        loadMore: true,
        type: _currentFilter,
      );
      
      setState(() {
        _isLoadingMore = false;
      });
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
    final walletState = ref.watch(walletProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Historique des Transactions'),
        backgroundColor: Theme.of(context).primaryColor,
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
      body: RefreshIndicator(
        onRefresh: () => ref.read(walletProvider.notifier).loadTransactionHistory(
          type: _currentFilter,
        ),
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
                    Theme.of(context).primaryColor.withValues(alpha: 0.1),
                    Theme.of(context).primaryColor.withValues(alpha: 0.05),
                  ],
                ),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Theme.of(context).primaryColor.withValues(alpha: 0.2)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _SummaryItem(
                    title: 'Solde Actuel',
                    value: '${walletState.balance.toStringAsFixed(0)} XAF',
                    icon: Icons.account_balance_wallet,
                    color: Theme.of(context).primaryColor,
                  ),
                  Container(
                    width: 1,
                    height: 40,
                    color: Colors.grey[300],
                  ),
                  _SummaryItem(
                    title: 'Transactions',
                    value: walletState.transactions.length.toString(),
                    icon: Icons.receipt_long,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
            
            // Transactions List
            Expanded(
              child: walletState.isLoadingTransactions && walletState.transactions.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : walletState.transactions.isEmpty
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
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: Colors.grey[600],
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                _getEmptyMessage(_currentFilter),
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: Colors.grey[500],
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        )
                      : ListView.builder(
                          controller: _scrollController,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          itemCount: walletState.transactions.length + (_isLoadingMore ? 1 : 0),
                          itemBuilder: (context, index) {
                            if (index == walletState.transactions.length) {
                              return const Padding(
                                padding: EdgeInsets.all(16),
                                child: Center(child: CircularProgressIndicator()),
                              );
                            }
                            
                            return TransactionTile(
                              transaction: walletState.transactions[index],
                            );
                          },
                        ),
            ),
            
            // Error Display
            if (walletState.error != null)
              Container(
                width: double.infinity,
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.red[50],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.red[200]!),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.error_outline,
                      color: Colors.red[600],
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        walletState.error!,
                        style: TextStyle(
                          color: Colors.red[800],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      color: Colors.red[600],
                      onPressed: () {
                        ref.read(walletProvider.notifier).clearError();
                      },
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  String _getEmptyMessage(TransactionType? filter) {
    if (filter == null) {
      return 'Commencez à utiliser votre portefeuille pour voir vos transactions ici';
    }
    
    switch (filter) {
      case TransactionType.topup:
        return 'Aucune recharge effectuée pour le moment';
      case TransactionType.payment:
        return 'Aucun paiement effectué pour le moment';
      case TransactionType.refund:
        return 'Aucun remboursement reçu pour le moment';
      case TransactionType.bonus:
        return 'Aucun bonus reçu pour le moment';
      case TransactionType.transfer:
        return 'Aucun transfert effectué pour le moment';
      case TransactionType.withdrawal:
        return 'Aucun retrait effectué pour le moment';
    }
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
        Icon(
          icon,
          size: 28,
          color: color,
        ),
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