import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/two_factor_auth.dart';
import '../../data/repositories/two_factor_repository.dart';

final twoFactorRepositoryProvider = Provider<TwoFactorRepository>((ref) {
  return TwoFactorRepository();
});

final twoFactorConfigProvider = FutureProvider<TwoFactorConfig>((ref) async {
  final repository = ref.watch(twoFactorRepositoryProvider);
  return repository.getTwoFactorConfig();
});

final twoFactorProvider = StateNotifierProvider<TwoFactorNotifier, TwoFactorState>((ref) {
  final repository = ref.watch(twoFactorRepositoryProvider);
  return TwoFactorNotifier(repository);
});

class TwoFactorNotifier extends StateNotifier<TwoFactorState> {
  final TwoFactorRepository _repository;

  TwoFactorNotifier(this._repository) : super(const TwoFactorState()) {
    loadConfig();
  }

  Future<void> loadConfig() async {
    try {
      state = state.copyWith(isLoading: true);
      final config = await _repository.getTwoFactorConfig();
      state = state.copyWith(
        config: config,
        isLoading: false,
      );
    } catch (error) {
      state = state.copyWith(
        isLoading: false,
        error: error.toString(),
      );
    }
  }

  Future<TwoFactorSetupResponse> setupTotp() async {
    try {
      state = state.copyWith(isLoading: true);
      final response = await _repository.setupTotp();
      state = state.copyWith(
        setupResponse: response,
        isLoading: false,
      );
      return response;
    } catch (error) {
      state = state.copyWith(
        isLoading: false,
        error: error.toString(),
      );
      rethrow;
    }
  }

  Future<void> enableTotp(String verificationCode) async {
    try {
      state = state.copyWith(isLoading: true);
      await _repository.enableTotp(verificationCode);
      await loadConfig();
    } catch (error) {
      state = state.copyWith(
        isLoading: false,
        error: error.toString(),
      );
      rethrow;
    }
  }

  Future<void> disableTotp() async {
    try {
      state = state.copyWith(isLoading: true);
      await _repository.disableTotp();
      await loadConfig();
    } catch (error) {
      state = state.copyWith(
        isLoading: false,
        error: error.toString(),
      );
      rethrow;
    }
  }

  Future<void> enableSms() async {
    try {
      state = state.copyWith(isLoading: true);
      await _repository.enableSms();
      await loadConfig();
    } catch (error) {
      state = state.copyWith(
        isLoading: false,
        error: error.toString(),
      );
      rethrow;
    }
  }

  Future<void> disableSms() async {
    try {
      state = state.copyWith(isLoading: true);
      await _repository.disableSms();
      await loadConfig();
    } catch (error) {
      state = state.copyWith(
        isLoading: false,
        error: error.toString(),
      );
      rethrow;
    }
  }

  Future<void> enableEmail() async {
    try {
      state = state.copyWith(isLoading: true);
      await _repository.enableEmail();
      await loadConfig();
    } catch (error) {
      state = state.copyWith(
        isLoading: false,
        error: error.toString(),
      );
      rethrow;
    }
  }

  Future<void> disableEmail() async {
    try {
      state = state.copyWith(isLoading: true);
      await _repository.disableEmail();
      await loadConfig();
    } catch (error) {
      state = state.copyWith(
        isLoading: false,
        error: error.toString(),
      );
      rethrow;
    }
  }

  Future<void> generateBackupCodes() async {
    try {
      state = state.copyWith(isLoading: true);
      final codes = await _repository.generateBackupCodes();
      state = state.copyWith(
        newBackupCodes: codes,
        isLoading: false,
      );
      await loadConfig();
    } catch (error) {
      state = state.copyWith(
        isLoading: false,
        error: error.toString(),
      );
      rethrow;
    }
  }

  Future<void> removeTrustedDevice(String deviceId) async {
    try {
      state = state.copyWith(isLoading: true);
      await _repository.removeTrustedDevice(deviceId);
      await loadConfig();
    } catch (error) {
      state = state.copyWith(
        isLoading: false,
        error: error.toString(),
      );
      rethrow;
    }
  }

  Future<void> verifyTwoFactor(TwoFactorVerificationRequest request) async {
    try {
      state = state.copyWith(isLoading: true);
      await _repository.verifyTwoFactor(request);
      state = state.copyWith(isLoading: false);
    } catch (error) {
      state = state.copyWith(
        isLoading: false,
        error: error.toString(),
      );
      rethrow;
    }
  }

  Future<void> updateSettings({
    bool? requireForLogin,
    bool? allowTrustedDevices,
    bool? requireForSensitiveActions,
  }) async {
    try {
      state = state.copyWith(isLoading: true);
      await _repository.updateSettings(
        requireForLogin: requireForLogin,
        allowTrustedDevices: allowTrustedDevices,
        requireForSensitiveActions: requireForSensitiveActions,
      );
      await loadConfig();
    } catch (error) {
      state = state.copyWith(
        isLoading: false,
        error: error.toString(),
      );
      rethrow;
    }
  }

  Future<void> regenerateTOTPSecret() async {
    try {
      state = state.copyWith(isLoading: true);
      final response = await _repository.regenerateTOTPSecret();
      state = state.copyWith(
        setupResponse: response,
        isLoading: false,
      );
    } catch (error) {
      state = state.copyWith(
        isLoading: false,
        error: error.toString(),
      );
      rethrow;
    }
  }

  Future<void> regenerateBackupCodes() async {
    try {
      state = state.copyWith(isLoading: true);
      final codes = await _repository.regenerateBackupCodes();
      state = state.copyWith(
        newBackupCodes: codes,
        isLoading: false,
      );
      await loadConfig();
    } catch (error) {
      state = state.copyWith(
        isLoading: false,
        error: error.toString(),
      );
      rethrow;
    }
  }

  Future<void> downloadBackupCodes() async {
    try {
      await _repository.downloadBackupCodes();
    } catch (error) {
      state = state.copyWith(
        error: error.toString(),
      );
      rethrow;
    }
  }

  Future<void> revokeTrustedDevice(String deviceId) async {
    try {
      state = state.copyWith(isLoading: true);
      await _repository.revokeTrustedDevice(deviceId);
      await loadConfig();
    } catch (error) {
      state = state.copyWith(
        isLoading: false,
        error: error.toString(),
      );
      rethrow;
    }
  }

  Future<void> revokeAllTrustedDevices() async {
    try {
      state = state.copyWith(isLoading: true);
      await _repository.revokeAllTrustedDevices();
      await loadConfig();
    } catch (error) {
      state = state.copyWith(
        isLoading: false,
        error: error.toString(),
      );
      rethrow;
    }
  }

  Future<void> disable2FA() async {
    try {
      state = state.copyWith(isLoading: true);
      await _repository.disable2FA();
      await loadConfig();
    } catch (error) {
      state = state.copyWith(
        isLoading: false,
        error: error.toString(),
      );
      rethrow;
    }
  }

  void clearError() {
    state = state.copyWith(error: null);
  }

  void clearSetupResponse() {
    state = state.copyWith(setupResponse: null);
  }

  void clearBackupCodes() {
    state = state.copyWith(newBackupCodes: null);
  }
}

class TwoFactorState {
  final TwoFactorConfig? config;
  final TwoFactorSetupResponse? setupResponse;
  final List<String>? newBackupCodes;
  final bool isLoading;
  final String? error;

  const TwoFactorState({
    this.config,
    this.setupResponse,
    this.newBackupCodes,
    this.isLoading = false,
    this.error,
  });

  TwoFactorState copyWith({
    TwoFactorConfig? config,
    TwoFactorSetupResponse? setupResponse,
    List<String>? newBackupCodes,
    bool? isLoading,
    String? error,
  }) {
    return TwoFactorState(
      config: config ?? this.config,
      setupResponse: setupResponse ?? this.setupResponse,
      newBackupCodes: newBackupCodes ?? this.newBackupCodes,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  T when<T>({
    required T Function() loading,
    required T Function(TwoFactorConfig config) data,
    required T Function(String error) error,
  }) {
    if (isLoading) return loading();
    if (this.error != null) return error(this.error!);
    if (config != null) return data(config!);
    return loading();
  }

  TwoFactorConfig? get valueOrNull => config;
}