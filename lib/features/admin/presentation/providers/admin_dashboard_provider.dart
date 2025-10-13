/// Admin Dashboard Provider (Simple version without freezed)
/// State management for admin dashboard using Riverpod
library;

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/admin_stats.dart';
import '../../domain/repositories/admin_repository.dart';
import '../../data/repositories/admin_repository_impl.dart';
import '../../data/services/admin_api_service.dart';

// ===================== PROVIDERS =====================

/// Admin API Service Provider
final adminApiServiceProvider = Provider<AdminApiService>((ref) {
  return AdminApiService();
});

/// Admin Repository Provider
final adminRepositoryProvider = Provider<AdminRepository>((ref) {
  final apiService = ref.watch(adminApiServiceProvider);
  return AdminRepositoryImpl(apiService: apiService);
});

/// Admin Dashboard Provider
final adminDashboardProvider =
    StateNotifierProvider<AdminDashboardNotifier, AdminDashboardState>((ref) {
  final repository = ref.watch(adminRepositoryProvider);
  return AdminDashboardNotifier(repository);
});

// ===================== DASHBOARD STATE =====================

class AdminDashboardState {
  final bool isLoading;
  final bool isRefreshing;
  final AdminStats? stats;
  final String? error;
  final DateTime? lastUpdated;

  const AdminDashboardState({
    this.isLoading = false,
    this.isRefreshing = false,
    this.stats,
    this.error,
    this.lastUpdated,
  });

  AdminDashboardState copyWith({
    bool? isLoading,
    bool? isRefreshing,
    AdminStats? stats,
    String? error,
    DateTime? lastUpdated,
  }) {
    return AdminDashboardState(
      isLoading: isLoading ?? this.isLoading,
      isRefreshing: isRefreshing ?? this.isRefreshing,
      stats: stats ?? this.stats,
      error: error,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }
}

// ===================== DASHBOARD NOTIFIER =====================

class AdminDashboardNotifier extends StateNotifier<AdminDashboardState> {
  final AdminRepository _repository;

  AdminDashboardNotifier(this._repository)
      : super(const AdminDashboardState()) {
    loadDashboardStats();
  }

  /// Load dashboard statistics
  Future<void> loadDashboardStats() async {
    state = state.copyWith(isLoading: true, error: null);

    final result = await _repository.getPlatformStats();

    result.when(
      success: (stats) {
        state = state.copyWith(
          isLoading: false,
          stats: stats,
          lastUpdated: DateTime.now(),
          error: null,
        );
      },
      failure: (error) {
        debugPrint('Load dashboard stats error: $error');
        state = state.copyWith(
          isLoading: false,
          error: error,
        );
      },
    );
  }

  /// Refresh dashboard statistics
  Future<void> refreshDashboardStats() async {
    state = state.copyWith(isRefreshing: true, error: null);

    final result = await _repository.getPlatformStats();

    result.when(
      success: (stats) {
        state = state.copyWith(
          isRefreshing: false,
          stats: stats,
          lastUpdated: DateTime.now(),
          error: null,
        );
      },
      failure: (error) {
        debugPrint('Refresh dashboard stats error: $error');
        state = state.copyWith(
          isRefreshing: false,
          error: error,
        );
      },
    );
  }

  /// Clear error
  void clearError() {
    state = state.copyWith(error: null);
  }
}
