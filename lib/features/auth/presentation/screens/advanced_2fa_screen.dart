import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../domain/models/two_factor_auth.dart';
import '../providers/two_factor_provider.dart';
import '../widgets/backup_codes_widget.dart';
import '../widgets/trusted_devices_widget.dart';
import '../widgets/totp_setup_widget.dart';
import '../../../../core/widgets/loading_widget.dart';

class Advanced2FAScreen extends ConsumerStatefulWidget {
  const Advanced2FAScreen({super.key});

  @override
  ConsumerState<Advanced2FAScreen> createState() => _Advanced2FAScreenState();
}

class _Advanced2FAScreenState extends ConsumerState<Advanced2FAScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final twoFactorState = ref.watch(twoFactorConfigProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Authentification à deux facteurs'),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: const [
            Tab(
              icon: Icon(Icons.security),
              text: 'Configuration',
            ),
            Tab(
              icon: Icon(Icons.qr_code),
              text: 'TOTP',
            ),
            Tab(
              icon: Icon(Icons.backup),
              text: 'Codes de secours',
            ),
            Tab(
              icon: Icon(Icons.devices),
              text: 'Appareils',
            ),
          ],
        ),
      ),
      body: twoFactorState.when(
        data: (config) => TabBarView(
          controller: _tabController,
          children: [
            _buildConfigurationTab(config),
            _buildTOTPTab(config),
            _buildBackupCodesTab(config),
            _buildTrustedDevicesTab(config),
          ],
        ),
        loading: () => const LoadingWidget(),
        error: (error, stackTrace) => Center(
          child: Text('Error: ${error.toString()}'),
        ),
      ),
    );
  }

  Widget _buildConfigurationTab(TwoFactorConfig config) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 2FA Status Card
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: config.isEnabled
                              ? Colors.green.withValues(alpha: 0.1)
                              : Colors.orange.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          config.isEnabled ? Icons.shield : Icons.shield_outlined,
                          color: config.isEnabled ? Colors.green : Colors.orange,
                          size: 32,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              config.isEnabled
                                  ? 'Authentification à deux facteurs activée'
                                  : 'Authentification à deux facteurs désactivée',
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              config.isEnabled
                                  ? 'Votre compte est protégé'
                                  : 'Activez la 2FA pour plus de sécurité',
                              style: TextStyle(
                                color: config.isEnabled ? Colors.green : Colors.orange,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  if (config.isEnabled) ...[
                    const SizedBox(height: 20),
                    const Divider(),
                    const SizedBox(height: 16),
                    _buildEnabledMethodsList(config),
                  ],
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Available Methods
          Text(
            'Méthodes disponibles',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),

          // TOTP Method
          _buildMethodCard(
            icon: Icons.smartphone,
            title: 'Application d\'authentification (TOTP)',
            subtitle: 'Google Authenticator, Authy, etc.',
            isEnabled: config.totpEnabled,
            onToggle: config.totpEnabled ? _disableTOTP : _enableTOTP,
          ),

          // SMS Method
          _buildMethodCard(
            icon: Icons.sms,
            title: 'SMS',
            subtitle: 'Codes envoyés par SMS',
            isEnabled: config.smsEnabled,
            onToggle: config.smsEnabled ? _disableSMS : _enableSMS,
          ),

          // Email Method
          _buildMethodCard(
            icon: Icons.email,
            title: 'Email',
            subtitle: 'Codes envoyés par email',
            isEnabled: config.emailEnabled,
            onToggle: config.emailEnabled ? _disableEmail : _enableEmail,
          ),

          const SizedBox(height: 24),

          // Security Settings
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Paramètres de sécurité',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SwitchListTile(
                    title: const Text('Demander la 2FA à chaque connexion'),
                    subtitle: const Text('Recommandé pour une sécurité maximale'),
                    value: config.requireForLogin ?? false,
                    onChanged: _toggleRequireForLogin,
                  ),
                  SwitchListTile(
                    title: const Text('Mémoriser cet appareil'),
                    subtitle: const Text('Ne pas demander la 2FA sur cet appareil pendant 30 jours'),
                    value: config.allowTrustedDevices ?? false,
                    onChanged: _toggleTrustedDevices,
                  ),
                  SwitchListTile(
                    title: const Text('Demander la 2FA pour les actions sensibles'),
                    subtitle: const Text('Changement de mot de passe, paramètres de sécurité'),
                    value: config.requireForSensitiveActions ?? false,
                    onChanged: _toggleSensitiveActions,
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Danger Zone
          if (config.isEnabled)
            Card(
              color: Colors.red.shade50,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.warning, color: Colors.red.shade700),
                        const SizedBox(width: 8),
                        Text(
                          'Zone dangereuse',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.red.shade700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: _showDisable2FADialog,
                        icon: const Icon(Icons.security_outlined),
                        label: const Text('Désactiver la 2FA'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.red.shade700,
                          side: BorderSide(color: Colors.red.shade700),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildEnabledMethodsList(TwoFactorConfig config) {
    final enabledMethods = <String>[];
    if (config.totpEnabled) enabledMethods.add('Application d\'authentification');
    if (config.smsEnabled) enabledMethods.add('SMS');
    if (config.emailEnabled) enabledMethods.add('Email');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Méthodes actives:',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        ...enabledMethods.map((method) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Row(
            children: [
              Icon(Icons.check_circle, color: Colors.green, size: 16),
              const SizedBox(width: 8),
              Text(method),
            ],
          ),
        )),
      ],
    );
  }

  Widget _buildMethodCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool isEnabled,
    required VoidCallback onToggle,
  }) {
    return Card(
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isEnabled
                ? Colors.green.withValues(alpha: 0.1)
                : Theme.of(context).primaryColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: isEnabled ? Colors.green : Theme.of(context).primaryColor,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        subtitle: Text(subtitle),
        trailing: Switch(
          value: isEnabled,
          onChanged: (_) => onToggle(),
        ),
        onTap: onToggle,
      ),
    );
  }

  Widget _buildTOTPTab(TwoFactorConfig config) {
    if (!config.totpEnabled) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.qr_code_scanner,
              size: 80,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 16),
            Text(
              'TOTP non configuré',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Activez l\'authentification TOTP dans la configuration',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => _tabController.animateTo(0),
              child: const Text('Aller à la configuration'),
            ),
          ],
        ),
      );
    }

    return TOTPSetupWidget(
      secret: config.totpSecret ?? '',
      qrCodeUrl: config.qrCodeUrl ?? '',
    );
  }

  Widget _buildBackupCodesTab(TwoFactorConfig config) {
    if (!config.isEnabled) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.backup_outlined,
              size: 80,
              color: Colors.grey,
            ),
            SizedBox(height: 16),
            Text(
              'Activez la 2FA pour générer des codes de secours',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return BackupCodesWidget(
      backupCodes: config.backupCodes,
    );
  }

  Widget _buildTrustedDevicesTab(TwoFactorConfig config) {
    if (!config.isEnabled || !(config.allowTrustedDevices ?? false)) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.devices_other,
              size: 80,
              color: Colors.grey,
            ),
            SizedBox(height: 16),
            Text(
              'Les appareils de confiance ne sont pas activés',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return TrustedDevicesWidget(
      devices: config.trustedDevices,
    );
  }

  // Method implementations
  void _enableTOTP() async {
    try {
      await ref.read(twoFactorProvider.notifier).enableTotp(''); // TODO: Get verification code
      _tabController.animateTo(1); // Switch to TOTP tab
    } catch (error) {
      _showErrorSnackBar(error.toString());
    }
  }

  void _disableTOTP() async {
    final confirmed = await _showConfirmationDialog(
      'Désactiver TOTP',
      'Êtes-vous sûr de vouloir désactiver l\'authentification TOTP ?',
    );
    if (confirmed) {
      try {
        await ref.read(twoFactorProvider.notifier).disableTotp();
      } catch (error) {
        _showErrorSnackBar(error.toString());
      }
    }
  }

  void _enableSMS() async {
    // Show phone number input dialog
    final phoneNumber = await _showPhoneInputDialog();
    if (phoneNumber != null) {
      try {
        await ref.read(twoFactorProvider.notifier).enableSms();
      } catch (error) {
        _showErrorSnackBar(error.toString());
      }
    }
  }

  void _disableSMS() async {
    final confirmed = await _showConfirmationDialog(
      'Désactiver SMS',
      'Êtes-vous sûr de vouloir désactiver l\'authentification par SMS ?',
    );
    if (confirmed) {
      try {
        await ref.read(twoFactorProvider.notifier).disableSms();
      } catch (error) {
        _showErrorSnackBar(error.toString());
      }
    }
  }

  void _enableEmail() async {
    try {
      await ref.read(twoFactorProvider.notifier).enableEmail();
    } catch (error) {
      _showErrorSnackBar(error.toString());
    }
  }

  void _disableEmail() async {
    final confirmed = await _showConfirmationDialog(
      'Désactiver Email',
      'Êtes-vous sûr de vouloir désactiver l\'authentification par email ?',
    );
    if (confirmed) {
      try {
        await ref.read(twoFactorProvider.notifier).disableEmail();
      } catch (error) {
        _showErrorSnackBar(error.toString());
      }
    }
  }

  void _toggleRequireForLogin(bool value) async {
    try {
      await ref.read(twoFactorProvider.notifier).updateSettings(
        requireForLogin: value,
      );
    } catch (error) {
      _showErrorSnackBar(error.toString());
    }
  }

  void _toggleTrustedDevices(bool value) async {
    try {
      await ref.read(twoFactorProvider.notifier).updateSettings(
        allowTrustedDevices: value,
      );
    } catch (error) {
      _showErrorSnackBar(error.toString());
    }
  }

  void _toggleSensitiveActions(bool value) async {
    try {
      await ref.read(twoFactorProvider.notifier).updateSettings(
        requireForSensitiveActions: value,
      );
    } catch (error) {
      _showErrorSnackBar(error.toString());
    }
  }

  void _regenerateTOTPSecret() async {
    final confirmed = await _showConfirmationDialog(
      'Régénérer le secret TOTP',
      'Cela invalidera votre configuration actuelle. Vous devrez reconfigurer votre application d\'authentification.',
    );
    if (confirmed) {
      try {
        await ref.read(twoFactorProvider.notifier).regenerateTOTPSecret();
        _showSuccessSnackBar('Secret TOTP régénéré');
      } catch (error) {
        _showErrorSnackBar(error.toString());
      }
    }
  }

  void _showTOTPQRCode() async {
    final config = ref.read(twoFactorProvider).valueOrNull;
    if (config?.totpSecret == null) return;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Code QR TOTP'),
        content: SizedBox(
          width: 250,
          height: 250,
          child: QrImageView(
            data: config!.qrCodeUrl!,
            version: QrVersions.auto,
            size: 250,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Fermer'),
          ),
          TextButton(
            onPressed: () {
              Clipboard.setData(ClipboardData(text: config.totpSecret!));
              Navigator.pop(context);
              _showSuccessSnackBar('Secret copié dans le presse-papiers');
            },
            child: const Text('Copier le secret'),
          ),
        ],
      ),
    );
  }

  void _regenerateBackupCodes() async {
    final confirmed = await _showConfirmationDialog(
      'Régénérer les codes de secours',
      'Cela invalidera tous vos codes de secours actuels. Assurez-vous de sauvegarder les nouveaux codes.',
    );
    if (confirmed) {
      try {
        await ref.read(twoFactorProvider.notifier).regenerateBackupCodes();
        _showSuccessSnackBar('Codes de secours régénérés');
      } catch (error) {
        _showErrorSnackBar(error.toString());
      }
    }
  }

  void _downloadBackupCodes() async {
    try {
      await ref.read(twoFactorProvider.notifier).downloadBackupCodes();
      _showSuccessSnackBar('Codes de secours téléchargés');
    } catch (error) {
      _showErrorSnackBar(error.toString());
    }
  }

  void _revokeTrustedDevice(String deviceId) async {
    final confirmed = await _showConfirmationDialog(
      'Révoquer l\'appareil',
      'Cet appareil ne sera plus considéré comme de confiance.',
    );
    if (confirmed) {
      try {
        await ref.read(twoFactorProvider.notifier).revokeTrustedDevice(deviceId);
        _showSuccessSnackBar('Appareil révoqué');
      } catch (error) {
        _showErrorSnackBar(error.toString());
      }
    }
  }

  void _revokeAllTrustedDevices() async {
    final confirmed = await _showConfirmationDialog(
      'Révoquer tous les appareils',
      'Tous les appareils de confiance seront révoqués. Vous devrez confirmer votre identité sur tous vos appareils.',
    );
    if (confirmed) {
      try {
        await ref.read(twoFactorProvider.notifier).revokeAllTrustedDevices();
        _showSuccessSnackBar('Tous les appareils révoqués');
      } catch (error) {
        _showErrorSnackBar(error.toString());
      }
    }
  }

  void _showDisable2FADialog() async {
    final confirmed = await _showConfirmationDialog(
      'Désactiver la 2FA',
      'ATTENTION: Cela réduira considérablement la sécurité de votre compte. Êtes-vous sûr de vouloir désactiver complètement l\'authentification à deux facteurs ?',
      isDestructive: true,
    );
    if (confirmed) {
      try {
        await ref.read(twoFactorProvider.notifier).disable2FA();
        _showSuccessSnackBar('Authentification à deux facteurs désactivée');
      } catch (error) {
        _showErrorSnackBar(error.toString());
      }
    }
  }

  Future<bool> _showConfirmationDialog(String title, String content, {bool isDestructive = false}) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Annuler'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: isDestructive
                ? ElevatedButton.styleFrom(backgroundColor: Colors.red)
                : null,
            child: const Text('Confirmer'),
          ),
        ],
      ),
    );
    return result ?? false;
  }

  Future<String?> _showPhoneInputDialog() async {
    final controller = TextEditingController();
    final result = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Numéro de téléphone'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            labelText: 'Numéro de téléphone',
            hintText: '+237XXXXXXXXX',
            prefixIcon: Icon(Icons.phone),
          ),
          keyboardType: TextInputType.phone,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, controller.text),
            child: const Text('Confirmer'),
          ),
        ],
      ),
    );
    controller.dispose();
    return result;
  }

  void _showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }
}