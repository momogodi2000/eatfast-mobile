/// User Management Provider (Simple version without freezed)
/// State management for user management using Riverpod
library;

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/user_management.dart';
import '../../domain/repositories/admin_repository.dart';
import '../../data/repositories/admin_repository_impl.dart';
import '../../data/services/admin_api_service.dart';

// ===================== PROVIDERS =====================

/// Admin API Service Provider
final userManagementApiServiceProvider = Provider<AdminApiService>((ref) {
  return AdminApiService();
});

/// Admin Repository Provider
final userManagementRepositoryProvider = Provider<AdminRepository>((ref) {
  final apiService = ref.watch(userManagementApiServiceProvider);
  return AdminRepositoryImpl(apiService: apiService);
});

/// User Management Provider
final userManagementProvider =
    StateNotifierProvider<UserManagementNotifier, UserManagementState>((ref) {
  final repository = ref.watch(userManagementRepositoryProvider);
  return UserManagementNotifier(repository);
});

// ===================== USER MANAGEMENT STATE =====================

class UserManagementState {
  final bool isLoading;
  final List<UserAccount> users;
  final UserAccount? selectedUser;
  final List<UserActivity> userActivity;
  final String? error;
  final int currentPage;
  final int pageSize;
  final int totalUsers;
  final bool hasMore;
  // Filters
  final UserRole? filterRole;
  final UserStatus? filterStatus;
  final String? searchQuery;

  const UserManagementState({
    this.isLoading = false,
    this.users = const [],
    this.selectedUser,
    this.userActivity = const [],
    this.error,
    this.currentPage = 1,
    this.pageSize = 20,
    this.totalUsers = 0,
    this.hasMore = false,
    this.filterRole,
    this.filterStatus,
    this.searchQuery,
  });

  UserManagementState copyWith({
    bool? isLoading,
    List<UserAccount>? users,
    UserAccount? selectedUser,
    List<UserActivity>? userActivity,
    String? error,
    int? currentPage,
    int? pageSize,
    int? totalUsers,
    bool? hasMore,
    UserRole? filterRole,
    UserStatus? filterStatus,
    String? searchQuery,
    bool clearError = false,
    bool clearSelectedUser = false,
  }) {
    return UserManagementState(
      isLoading: isLoading ?? this.isLoading,
      users: users ?? this.users,
      selectedUser: clearSelectedUser ? null : (selectedUser ?? this.selectedUser),
      userActivity: userActivity ?? this.userActivity,
      error: clearError ? null : error,
      currentPage: currentPage ?? this.currentPage,
      pageSize: pageSize ?? this.pageSize,
      totalUsers: totalUsers ?? this.totalUsers,
      hasMore: hasMore ?? this.hasMore,
      filterRole: filterRole ?? this.filterRole,
      filterStatus: filterStatus ?? this.filterStatus,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}

// ===================== USER MANAGEMENT NOTIFIER =====================

class UserManagementNotifier extends StateNotifier<UserManagementState> {
  final AdminRepository _repository;

  UserManagementNotifier(this._repository) : super(const UserManagementState()) {
    loadUsers();
  }

  /// Load users with current filters
  Future<void> loadUsers() async {
    state = state.copyWith(isLoading: true, clearError: true);

    final result = await _repository.getUsers(
      role: state.filterRole,
      status: state.filterStatus,
      searchQuery: state.searchQuery,
      limit: state.pageSize,
      offset: (state.currentPage - 1) * state.pageSize,
    );

    result.when(
      success: (users) {
        state = state.copyWith(
          isLoading: false,
          users: users,
          hasMore: users.length >= state.pageSize,
          clearError: true,
        );
      },
      failure: (error) {
        debugPrint('Load users error: $error');
        state = state.copyWith(
          isLoading: false,
          error: error,
        );
      },
    );
  }

  /// Load user details
  Future<void> loadUserDetails(String userId) async {
    state = state.copyWith(isLoading: true, clearError: true);

    final result = await _repository.getUserDetails(userId);

    result.when(
      success: (user) {
        state = state.copyWith(
          isLoading: false,
          selectedUser: user,
          clearError: true,
        );
        // Load user activity
        loadUserActivity(userId);
      },
      failure: (error) {
        debugPrint('Load user details error: $error');
        state = state.copyWith(
          isLoading: false,
          error: error,
        );
      },
    );
  }

  /// Load user activity
  Future<void> loadUserActivity(String userId) async {
    final result = await _repository.getUserActivity(userId);

    result.when(
      success: (activity) {
        state = state.copyWith(
          userActivity: activity,
        );
      },
      failure: (error) {
        debugPrint('Load user activity error: $error');
        // Don't overwrite main error
      },
    );
  }

  /// Update user status
  Future<bool> updateUserStatus(
    String userId,
    UserStatus status, {
    String? reason,
  }) async {
    state = state.copyWith(clearError: true);

    final result = await _repository.updateUserStatus(
      userId,
      status,
      reason: reason,
    );

    return result.when(
      success: (_) {
        // Reload users to reflect changes
        loadUsers();
        return true;
      },
      failure: (error) {
        state = state.copyWith(error: error);
        return false;
      },
    );
  }

  /// Suspend user
  Future<bool> suspendUser(String userId, String reason) async {
    final result = await _repository.suspendUser(userId, reason, null);

    return result.when(
      success: (_) {
        loadUsers();
        return true;
      },
      failure: (error) {
        state = state.copyWith(error: error);
        return false;
      },
    );
  }

  /// Unsuspend user
  Future<bool> unsuspendUser(String userId) async {
    final result = await _repository.unsuspendUser(userId);

    return result.when(
      success: (_) {
        loadUsers();
        return true;
      },
      failure: (error) {
        state = state.copyWith(error: error);
        return false;
      },
    );
  }

  /// Ban user
  Future<bool> banUser(String userId, String reason) async {
    final result = await _repository.banUser(userId, reason);

    return result.when(
      success: (_) {
        loadUsers();
        return true;
      },
      failure: (error) {
        state = state.copyWith(error: error);
        return false;
      },
    );
  }

  /// Delete user
  Future<bool> deleteUser(String userId) async {
    final result = await _repository.deleteUser(userId);

    return result.when(
      success: (_) {
        loadUsers();
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
    UserRole? role,
    UserStatus? status,
    String? searchQuery,
  }) {
    state = state.copyWith(
      filterRole: role,
      filterStatus: status,
      searchQuery: searchQuery,
      currentPage: 1, // Reset to first page
    );
    loadUsers();
  }

  /// Clear filters
  void clearFilters() {
    state = UserManagementState(
      currentPage: 1,
      pageSize: state.pageSize,
    );
    loadUsers();
  }

  /// Go to next page
  void nextPage() {
    if (state.hasMore) {
      state = state.copyWith(currentPage: state.currentPage + 1);
      loadUsers();
    }
  }

  /// Go to previous page
  void previousPage() {
    if (state.currentPage > 1) {
      state = state.copyWith(currentPage: state.currentPage - 1);
      loadUsers();
    }
  }

  /// Search users
  void searchUsers(String query) {
    state = state.copyWith(
      searchQuery: query.isEmpty ? null : query,
      currentPage: 1,
    );
    loadUsers();
  }

  /// Clear error
  void clearError() {
    state = state.copyWith(clearError: true);
  }

  /// Clear selected user
  void clearSelectedUser() {
    state = state.copyWith(clearSelectedUser: true, userActivity: []);
  }
}
