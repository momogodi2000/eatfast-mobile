import '../../domain/models/two_factor_auth.dart';
import '../../../../core/services/api/api_client.dart';

class TwoFactorRepository {
  final ApiClient _apiClient = ApiClient();

  Future<TwoFactorConfig> getTwoFactorConfig() async {
    try {
      final response = await _apiClient.get('/auth/2fa/config');
      return TwoFactorConfig.fromJson(response.data['data']);
    } catch (error) {
      throw Exception('Failed to load 2FA config: $error');
    }
  }

  Future<TwoFactorSetupResponse> setupTotp() async {
    try {
      final response = await _apiClient.post('/auth/2fa/totp/setup');
      return TwoFactorSetupResponse.fromJson(response.data['data']);
    } catch (error) {
      throw Exception('Failed to setup TOTP: $error');
    }
  }

  Future<void> enableTotp(String verificationCode) async {
    try {
      await _apiClient.post(
        '/auth/2fa/totp/enable',
        data: {'code': verificationCode},
      );
    } catch (error) {
      throw Exception('Failed to enable TOTP: $error');
    }
  }

  Future<void> disableTotp() async {
    try {
      await _apiClient.post('/auth/2fa/totp/disable');
    } catch (error) {
      throw Exception('Failed to disable TOTP: $error');
    }
  }

  Future<void> enableSms() async {
    try {
      await _apiClient.post('/auth/2fa/sms/enable');
    } catch (error) {
      throw Exception('Failed to enable SMS 2FA: $error');
    }
  }

  Future<void> disableSms() async {
    try {
      await _apiClient.post('/auth/2fa/sms/disable');
    } catch (error) {
      throw Exception('Failed to disable SMS 2FA: $error');
    }
  }

  Future<void> enableEmail() async {
    try {
      await _apiClient.post('/auth/2fa/email/enable');
    } catch (error) {
      throw Exception('Failed to enable email 2FA: $error');
    }
  }

  Future<void> disableEmail() async {
    try {
      await _apiClient.post('/auth/2fa/email/disable');
    } catch (error) {
      throw Exception('Failed to disable email 2FA: $error');
    }
  }

  Future<List<String>> generateBackupCodes() async {
    try {
      final response = await _apiClient.post('/auth/2fa/backup-codes/generate');
      final List<dynamic> codes = response.data['data']['codes'];
      return codes.cast<String>();
    } catch (error) {
      throw Exception('Failed to generate backup codes: $error');
    }
  }

  Future<List<TrustedDevice>> getTrustedDevices() async {
    try {
      final response = await _apiClient.get('/auth/2fa/trusted-devices');
      final List<dynamic> data = response.data['data'] ?? [];
      return data.map((json) => TrustedDevice.fromJson(json)).toList();
    } catch (error) {
      throw Exception('Failed to load trusted devices: $error');
    }
  }

  Future<void> removeTrustedDevice(String deviceId) async {
    try {
      await _apiClient.delete('/auth/2fa/trusted-devices/$deviceId');
    } catch (error) {
      throw Exception('Failed to remove trusted device: $error');
    }
  }

  Future<void> verifyTwoFactor(TwoFactorVerificationRequest request) async {
    try {
      await _apiClient.post(
        '/auth/2fa/verify',
        data: request.toJson(),
      );
    } catch (error) {
      throw Exception('Failed to verify 2FA code: $error');
    }
  }

  Future<void> sendSmsCode() async {
    try {
      await _apiClient.post('/auth/2fa/sms/send');
    } catch (error) {
      throw Exception('Failed to send SMS code: $error');
    }
  }

  Future<void> sendEmailCode() async {
    try {
      await _apiClient.post('/auth/2fa/email/send');
    } catch (error) {
      throw Exception('Failed to send email code: $error');
    }
  }

  Future<void> updateSettings({
    bool? requireForLogin,
    bool? allowTrustedDevices,
    bool? requireForSensitiveActions,
  }) async {
    try {
      await _apiClient.put('/auth/2fa/settings', data: {
        if (requireForLogin != null) 'requireForLogin': requireForLogin,
        if (allowTrustedDevices != null) 'allowTrustedDevices': allowTrustedDevices,
        if (requireForSensitiveActions != null) 'requireForSensitiveActions': requireForSensitiveActions,
      });
    } catch (error) {
      throw Exception('Failed to update 2FA settings: $error');
    }
  }

  Future<TwoFactorSetupResponse> regenerateTOTPSecret() async {
    try {
      final response = await _apiClient.post('/auth/2fa/totp/regenerate');
      return TwoFactorSetupResponse.fromJson(response.data['data']);
    } catch (error) {
      throw Exception('Failed to regenerate TOTP secret: $error');
    }
  }

  Future<List<String>> regenerateBackupCodes() async {
    try {
      final response = await _apiClient.post('/auth/2fa/backup-codes/regenerate');
      final List<dynamic> codes = response.data['data']['codes'];
      return codes.cast<String>();
    } catch (error) {
      throw Exception('Failed to regenerate backup codes: $error');
    }
  }

  Future<void> downloadBackupCodes() async {
    try {
      await _apiClient.get('/auth/2fa/backup-codes/download');
    } catch (error) {
      throw Exception('Failed to download backup codes: $error');
    }
  }

  Future<void> revokeTrustedDevice(String deviceId) async {
    try {
      await _apiClient.delete('/auth/2fa/trusted-devices/$deviceId');
    } catch (error) {
      throw Exception('Failed to revoke trusted device: $error');
    }
  }

  Future<void> revokeAllTrustedDevices() async {
    try {
      await _apiClient.delete('/auth/2fa/trusted-devices');
    } catch (error) {
      throw Exception('Failed to revoke all trusted devices: $error');
    }
  }

  Future<void> disable2FA() async {
    try {
      await _apiClient.post('/auth/2fa/disable');
    } catch (error) {
      throw Exception('Failed to disable 2FA: $error');
    }
  }
}