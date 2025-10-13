/// Restaurant Management Provider
/// State management for restaurant management using Riverpod
library;

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/user_management.dart';
import '../../domain/repositories/admin_repository.dart';
import '../../data/repositories/admin_repository_impl.dart';
import '../../data/services/admin_api_service.dart';

// ===================== PROVIDERS =====================

/// Admin API Service Provider for Restaurant Management
final restaurantApiServiceProvider = Provider<AdminApiService>((ref) {
  return AdminApiService();
});

/// Admin Repository Provider for Restaurant Management
final restaurantRepositoryProvider = Provider<AdminRepository>((ref) {
  final apiService = ref.watch(restaurantApiServiceProvider);
  return AdminRepositoryImpl(apiService: apiService);
});

/// Restaurant Management Provider
final restaurantManagementProvider = StateNotifierProvider<
    RestaurantManagementNotifier, RestaurantManagementState>((ref) {
  final repository = ref.watch(restaurantRepositoryProvider);
  return RestaurantManagementNotifier(repository);
});

// ===================== STATE =====================

class RestaurantManagementState {
  final bool isLoading;
  final List<RestaurantAccount> restaurants;
  final RestaurantAccount? selectedRestaurant;
  final String? error;
  final int currentPage;
  final int pageSize;
  final bool hasMore;
  // Filters
  final RestaurantStatus? filterStatus;
  final String? searchQuery;

  const RestaurantManagementState({
    this.isLoading = false,
    this.restaurants = const [],
    this.selectedRestaurant,
    this.error,
    this.currentPage = 1,
    this.pageSize = 20,
    this.hasMore = false,
    this.filterStatus,
    this.searchQuery,
  });

  RestaurantManagementState copyWith({
    bool? isLoading,
    List<RestaurantAccount>? restaurants,
    RestaurantAccount? selectedRestaurant,
    String? error,
    int? currentPage,
    int? pageSize,
    bool? hasMore,
    RestaurantStatus? filterStatus,
    String? searchQuery,
    bool clearError = false,
    bool clearSelected = false,
  }) {
    return RestaurantManagementState(
      isLoading: isLoading ?? this.isLoading,
      restaurants: restaurants ?? this.restaurants,
      selectedRestaurant: clearSelected ? null : (selectedRestaurant ?? this.selectedRestaurant),
      error: clearError ? null : error,
      currentPage: currentPage ?? this.currentPage,
      pageSize: pageSize ?? this.pageSize,
      hasMore: hasMore ?? this.hasMore,
      filterStatus: filterStatus ?? this.filterStatus,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}

// ===================== NOTIFIER =====================

class RestaurantManagementNotifier extends StateNotifier<RestaurantManagementState> {
  final AdminRepository _repository;

  RestaurantManagementNotifier(this._repository)
      : super(const RestaurantManagementState()) {
    loadRestaurants();
  }

  /// Load restaurants with current filters
  Future<void> loadRestaurants() async {
    state = state.copyWith(isLoading: true, clearError: true);

    final result = await _repository.getRestaurants(
      status: state.filterStatus,
      searchQuery: state.searchQuery,
      limit: state.pageSize,
      offset: (state.currentPage - 1) * state.pageSize,
    );

    result.when(
      success: (restaurants) {
        state = state.copyWith(
          isLoading: false,
          restaurants: restaurants,
          hasMore: restaurants.length >= state.pageSize,
          clearError: true,
        );
      },
      failure: (error) {
        debugPrint('Load restaurants error: $error');
        state = state.copyWith(
          isLoading: false,
          error: error,
        );
      },
    );
  }

  /// Verify restaurant
  Future<bool> verifyRestaurant(String restaurantId) async {
    final result = await _repository.verifyRestaurant(restaurantId);

    return result.when(
      success: (_) {
        loadRestaurants();
        return true;
      },
      failure: (error) {
        state = state.copyWith(error: error);
        return false;
      },
    );
  }

  /// Reject restaurant
  Future<bool> rejectRestaurant(String restaurantId, String reason) async {
    final result = await _repository.rejectRestaurant(restaurantId, reason);

    return result.when(
      success: (_) {
        loadRestaurants();
        return true;
      },
      failure: (error) {
        state = state.copyWith(error: error);
        return false;
      },
    );
  }

  /// Suspend restaurant
  Future<bool> suspendRestaurant(String restaurantId, String reason) async {
    final result = await _repository.suspendRestaurant(
      restaurantId,
      reason,
      null,
    );

    return result.when(
      success: (_) {
        loadRestaurants();
        return true;
      },
      failure: (error) {
        state = state.copyWith(error: error);
        return false;
      },
    );
  }

  /// Update commission rate
  Future<bool> updateCommissionRate(
    String restaurantId,
    double rate,
  ) async {
    final result = await _repository.updateCommissionRate(restaurantId, rate);

    return result.when(
      success: (_) {
        loadRestaurants();
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
    RestaurantStatus? status,
    String? searchQuery,
  }) {
    state = state.copyWith(
      filterStatus: status,
      searchQuery: searchQuery,
      currentPage: 1,
    );
    loadRestaurants();
  }

  /// Clear filters
  void clearFilters() {
    state = RestaurantManagementState(
      currentPage: 1,
      pageSize: state.pageSize,
    );
    loadRestaurants();
  }

  /// Search restaurants
  void searchRestaurants(String query) {
    state = state.copyWith(
      searchQuery: query.isEmpty ? null : query,
      currentPage: 1,
    );
    loadRestaurants();
  }

  /// Next page
  void nextPage() {
    if (state.hasMore) {
      state = state.copyWith(currentPage: state.currentPage + 1);
      loadRestaurants();
    }
  }

  /// Previous page
  void previousPage() {
    if (state.currentPage > 1) {
      state = state.copyWith(currentPage: state.currentPage - 1);
      loadRestaurants();
    }
  }

  /// Clear error
  void clearError() {
    state = state.copyWith(clearError: true);
  }
}
