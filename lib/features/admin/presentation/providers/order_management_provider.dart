/// Order Management Provider
/// State management for order management using Riverpod
library;

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/repositories/admin_repository.dart';
import '../../data/repositories/admin_repository_impl.dart';
import '../../data/services/admin_api_service.dart';

// ===================== PROVIDERS =====================

/// Admin API Service Provider for Order Management
final orderApiServiceProvider = Provider<AdminApiService>((ref) {
  return AdminApiService();
});

/// Admin Repository Provider for Order Management
final orderRepositoryProvider = Provider<AdminRepository>((ref) {
  final apiService = ref.watch(orderApiServiceProvider);
  return AdminRepositoryImpl(apiService: apiService);
});

/// Order Management Provider
final orderManagementProvider = StateNotifierProvider<
    OrderManagementNotifier, OrderManagementState>((ref) {
  final repository = ref.watch(orderRepositoryProvider);
  return OrderManagementNotifier(repository);
});

// ===================== STATE =====================

class OrderManagementState {
  final bool isLoading;
  final List<Map<String, dynamic>> orders;
  final Map<String, dynamic>? selectedOrder;
  final String? error;
  final int currentPage;
  final int pageSize;
  final bool hasMore;
  // Filters
  final String? filterStatus;
  final String? searchQuery;
  final DateTime? fromDate;
  final DateTime? toDate;

  const OrderManagementState({
    this.isLoading = false,
    this.orders = const [],
    this.selectedOrder,
    this.error,
    this.currentPage = 1,
    this.pageSize = 20,
    this.hasMore = false,
    this.filterStatus,
    this.searchQuery,
    this.fromDate,
    this.toDate,
  });

  OrderManagementState copyWith({
    bool? isLoading,
    List<Map<String, dynamic>>? orders,
    Map<String, dynamic>? selectedOrder,
    String? error,
    int? currentPage,
    int? pageSize,
    bool? hasMore,
    String? filterStatus,
    String? searchQuery,
    DateTime? fromDate,
    DateTime? toDate,
    bool clearError = false,
    bool clearSelected = false,
    bool clearDates = false,
  }) {
    return OrderManagementState(
      isLoading: isLoading ?? this.isLoading,
      orders: orders ?? this.orders,
      selectedOrder: clearSelected ? null : (selectedOrder ?? this.selectedOrder),
      error: clearError ? null : error,
      currentPage: currentPage ?? this.currentPage,
      pageSize: pageSize ?? this.pageSize,
      hasMore: hasMore ?? this.hasMore,
      filterStatus: filterStatus ?? this.filterStatus,
      searchQuery: searchQuery ?? this.searchQuery,
      fromDate: clearDates ? null : (fromDate ?? this.fromDate),
      toDate: clearDates ? null : (toDate ?? this.toDate),
    );
  }
}

// ===================== NOTIFIER =====================

class OrderManagementNotifier extends StateNotifier<OrderManagementState> {
  final AdminRepository _repository;

  OrderManagementNotifier(this._repository)
      : super(const OrderManagementState()) {
    loadOrders();
  }

  /// Load orders with current filters
  Future<void> loadOrders() async {
    state = state.copyWith(isLoading: true, clearError: true);

    final result = await _repository.getAllOrders(
      status: state.filterStatus,
      searchQuery: state.searchQuery,
      fromDate: state.fromDate,
      toDate: state.toDate,
      limit: state.pageSize,
      offset: (state.currentPage - 1) * state.pageSize,
    );

    result.when(
      success: (orders) {
        state = state.copyWith(
          isLoading: false,
          orders: orders,
          hasMore: orders.length >= state.pageSize,
          clearError: true,
        );
      },
      failure: (error) {
        debugPrint('Load orders error: $error');
        state = state.copyWith(
          isLoading: false,
          error: error,
        );
      },
    );
  }

  /// Cancel order
  Future<bool> cancelOrder(String orderId, String reason) async {
    final result = await _repository.cancelOrder(orderId, reason);

    return result.when(
      success: (_) {
        loadOrders();
        return true;
      },
      failure: (error) {
        state = state.copyWith(error: error);
        return false;
      },
    );
  }

  /// Refund order
  Future<bool> refundOrder(String orderId, double amount, String reason) async {
    final result = await _repository.refundOrder(orderId, amount, reason);

    return result.when(
      success: (_) {
        loadOrders();
        return true;
      },
      failure: (error) {
        state = state.copyWith(error: error);
        return false;
      },
    );
  }

  /// Apply filters
  void applyFilters({
    String? status,
    String? searchQuery,
    DateTime? fromDate,
    DateTime? toDate,
  }) {
    state = state.copyWith(
      filterStatus: status,
      searchQuery: searchQuery,
      fromDate: fromDate,
      toDate: toDate,
      currentPage: 1,
    );
    loadOrders();
  }

  /// Clear filters
  void clearFilters() {
    state = OrderManagementState(
      currentPage: 1,
      pageSize: state.pageSize,
    );
    loadOrders();
  }

  /// Search orders
  void searchOrders(String query) {
    state = state.copyWith(
      searchQuery: query.isEmpty ? null : query,
      currentPage: 1,
    );
    loadOrders();
  }

  /// Filter by status
  void filterByStatus(String? status) {
    state = state.copyWith(
      filterStatus: status,
      currentPage: 1,
    );
    loadOrders();
  }

  /// Filter by date range
  void filterByDateRange(DateTime? fromDate, DateTime? toDate) {
    state = state.copyWith(
      fromDate: fromDate,
      toDate: toDate,
      currentPage: 1,
    );
    loadOrders();
  }

  /// Clear date range filter
  void clearDateRangeFilter() {
    state = state.copyWith(
      clearDates: true,
      currentPage: 1,
    );
    loadOrders();
  }

  /// Next page
  void nextPage() {
    if (state.hasMore) {
      state = state.copyWith(currentPage: state.currentPage + 1);
      loadOrders();
    }
  }

  /// Previous page
  void previousPage() {
    if (state.currentPage > 1) {
      state = state.copyWith(currentPage: state.currentPage - 1);
      loadOrders();
    }
  }

  /// Clear error
  void clearError() {
    state = state.copyWith(clearError: true);
  }
}
