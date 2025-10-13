import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../domain/models/scheduled_order.dart';
import '../providers/scheduled_orders_provider.dart';
import '../widgets/create_scheduled_order_dialog.dart';
import '../widgets/scheduled_order_card.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../../core/widgets/error_widget.dart';

class ScheduledOrdersScreen extends ConsumerStatefulWidget {
  const ScheduledOrdersScreen({super.key});

  @override
  ConsumerState<ScheduledOrdersScreen> createState() => _ScheduledOrdersScreenState();
}

class _ScheduledOrdersScreenState extends ConsumerState<ScheduledOrdersScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scheduledOrdersAsync = ref.watch(scheduledOrdersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Commandes Programmées'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(
              icon: Icon(Icons.schedule),
              text: 'À venir',
            ),
            Tab(
              icon: Icon(Icons.repeat),
              text: 'Récurrentes',
            ),
            Tab(
              icon: Icon(Icons.history),
              text: 'Historique',
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _showCreateScheduledOrderDialog(context),
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildUpcomingOrders(scheduledOrdersAsync),
          _buildRecurringOrders(scheduledOrdersAsync),
          _buildOrderHistory(scheduledOrdersAsync),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'scheduled_orders_fab',
        onPressed: () => _showCreateScheduledOrderDialog(context),
        icon: const Icon(Icons.add_alarm),
        label: const Text('Programmer'),
      ),
    );
  }

  Widget _buildUpcomingOrders(AsyncValue<List<ScheduledOrder>> scheduledOrdersAsync) {
    return scheduledOrdersAsync.when(
      data: (orders) {
        final upcomingOrders = orders
            .where((order) =>
                order.status == ScheduledOrderStatus.scheduled &&
                order.scheduledDate.isAfter(DateTime.now()))
            .toList();

        if (upcomingOrders.isEmpty) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.schedule_outlined,
                  size: 80,
                  color: Colors.grey,
                ),
                SizedBox(height: 16),
                Text(
                  'Aucune commande programmée',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Programmez vos commandes favorites pour plus tard',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(scheduledOrdersProvider);
          },
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: upcomingOrders.length,
            itemBuilder: (context, index) {
              return ScheduledOrderCard(
                order: upcomingOrders[index],
                onTap: () => _navigateToOrderDetails(upcomingOrders[index]),
                onEdit: () => _editScheduledOrder(upcomingOrders[index]),
                onCancel: () => _cancelScheduledOrder(upcomingOrders[index]),
              );
            },
          ),
        );
      },
      loading: () => const LoadingWidget(),
      error: (error, stack) => ErrorDisplayWidget(
        error: error.toString(),
        onRetry: () => ref.invalidate(scheduledOrdersProvider),
      ),
    );
  }

  Widget _buildRecurringOrders(AsyncValue<List<ScheduledOrder>> scheduledOrdersAsync) {
    return scheduledOrdersAsync.when(
      data: (orders) {
        final recurringOrders = orders
            .where((order) => order.isRecurring)
            .toList();

        if (recurringOrders.isEmpty) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.repeat_outlined,
                  size: 80,
                  color: Colors.grey,
                ),
                SizedBox(height: 16),
                Text(
                  'Aucune commande récurrente',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Configurez des commandes automatiques hebdomadaires',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: recurringOrders.length,
          itemBuilder: (context, index) {
            return ScheduledOrderCard(
              order: recurringOrders[index],
              onTap: () => _navigateToOrderDetails(recurringOrders[index]),
              onEdit: () => _editScheduledOrder(recurringOrders[index]),
              onToggle: () => _toggleRecurringOrder(recurringOrders[index]),
            );
          },
        );
      },
      loading: () => const LoadingWidget(),
      error: (error, stack) => ErrorDisplayWidget(
        error: error.toString(),
        onRetry: () => ref.invalidate(scheduledOrdersProvider),
      ),
    );
  }

  Widget _buildOrderHistory(AsyncValue<List<ScheduledOrder>> scheduledOrdersAsync) {
    return scheduledOrdersAsync.when(
      data: (orders) {
        final pastOrders = orders
            .where((order) =>
                order.status == ScheduledOrderStatus.completed ||
                order.status == ScheduledOrderStatus.cancelled)
            .toList()
          ..sort((a, b) => b.scheduledDate.compareTo(a.scheduledDate));

        if (pastOrders.isEmpty) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.history_outlined,
                  size: 80,
                  color: Colors.grey,
                ),
                SizedBox(height: 16),
                Text(
                  'Aucun historique',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: pastOrders.length,
          itemBuilder: (context, index) {
            return ScheduledOrderCard(
              order: pastOrders[index],
              onTap: () => _navigateToOrderDetails(pastOrders[index]),
              showActions: false,
            );
          },
        );
      },
      loading: () => const LoadingWidget(),
      error: (error, stack) => ErrorDisplayWidget(
        error: error.toString(),
        onRetry: () => ref.invalidate(scheduledOrdersProvider),
      ),
    );
  }

  void _showCreateScheduledOrderDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const CreateScheduledOrderDialog(),
    ).then((result) {
      if (result == true) {
        ref.invalidate(scheduledOrdersProvider);
      }
    });
  }

  void _navigateToOrderDetails(ScheduledOrder order) {
    context.push('/scheduled-orders/${order.id}');
  }

  void _editScheduledOrder(ScheduledOrder order) {
    showDialog(
      context: context,
      builder: (context) => CreateScheduledOrderDialog(
        existingOrder: order,
      ),
    ).then((result) {
      if (result == true) {
        ref.invalidate(scheduledOrdersProvider);
      }
    });
  }

  void _cancelScheduledOrder(ScheduledOrder order) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Annuler la commande'),
        content: const Text('Êtes-vous sûr de vouloir annuler cette commande programmée ?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Non'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop();
              await ref.read(scheduledOrdersNotifierProvider.notifier).cancelScheduledOrder(order.id);
            },
            child: const Text('Oui'),
          ),
        ],
      ),
    );
  }

  void _toggleRecurringOrder(ScheduledOrder order) async {
    await ref.read(scheduledOrdersNotifierProvider.notifier).toggleRecurringOrder(order.id);
  }
}