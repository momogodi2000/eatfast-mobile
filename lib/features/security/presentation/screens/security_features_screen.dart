import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/design_tokens.dart';
import '../../domain/models/security_models.dart';

class SecurityFeaturesScreen extends ConsumerStatefulWidget {
  const SecurityFeaturesScreen({super.key});

  @override
  ConsumerState<SecurityFeaturesScreen> createState() => _SecurityFeaturesScreenState();
}

class _SecurityFeaturesScreenState extends ConsumerState<SecurityFeaturesScreen>
    with TickerProviderStateMixin {
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
    return Scaffold(
      backgroundColor: DesignTokens.backgroundPrimary,
      appBar: AppBar(
        title: const Text(
          'Security & Privacy',
          style: TextStyle(
            fontWeight: DesignTokens.fontWeightSemiBold,
            color: DesignTokens.textPrimary,
          ),
        ),
        backgroundColor: DesignTokens.backgroundPrimary,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.security, color: DesignTokens.primaryColor),
            onPressed: _showSecurityScan,
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: DesignTokens.primaryColor,
          unselectedLabelColor: DesignTokens.textSecondary,
          indicatorColor: DesignTokens.primaryColor,
          tabs: const [
            Tab(icon: Icon(Icons.lock), text: 'Auth'),
            Tab(icon: Icon(Icons.privacy_tip), text: 'Privacy'),
            Tab(icon: Icon(Icons.shield), text: 'Security'),
            Tab(icon: Icon(Icons.warning), text: 'Alerts'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildAuthenticationTab(),
          _buildPrivacyTab(),
          _buildSecurityTab(),
          _buildAlertsTab(),
        ],
      ),
    );
  }

  Widget _buildAuthenticationTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(DesignTokens.spaceMD),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Security Score
          _buildSecurityScore(),
          
          const SizedBox(height: DesignTokens.spaceLG),
          
          // Biometric Authentication
          _buildBiometricSection(),
          
          const SizedBox(height: DesignTokens.spaceLG),
          
          // Pin/Password Settings
          _buildPinPasswordSection(),
          
          const SizedBox(height: DesignTokens.spaceLG),
          
          // Session Management
          _buildSessionSection(),
        ],
      ),
    );
  }

  Widget _buildSecurityScore() {
    return Card(
      elevation: DesignTokens.elevation2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
      ),
      child: Padding(
        padding: const EdgeInsets.all(DesignTokens.spaceLG),
        child: Column(
          children: [
            Row(
              children: [
                const Icon(
                  Icons.security,
                  color: DesignTokens.successColor,
                  size: DesignTokens.iconLG,
                ),
                const SizedBox(width: DesignTokens.spaceMD),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Security Score',
                      style: TextStyle(
                        fontSize: DesignTokens.fontSizeLG,
                        fontWeight: DesignTokens.fontWeightSemiBold,
                        color: DesignTokens.textPrimary,
                      ),
                    ),
                    Text(
                      'Your account is well protected',
                      style: TextStyle(
                        color: DesignTokens.textSecondary,
                        fontSize: DesignTokens.fontSizeSM,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: DesignTokens.successColor.withValues(alpha: 0.1),
                  ),
                  child: const Center(
                    child: Text(
                      '85',
                      style: TextStyle(
                        fontSize: DesignTokens.fontSizeXL,
                        fontWeight: DesignTokens.fontWeightBold,
                        color: DesignTokens.successColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: DesignTokens.spaceMD),
            
            const LinearProgressIndicator(
              value: 0.85,
              backgroundColor: DesignTokens.lightGrey,
              valueColor: AlwaysStoppedAnimation<Color>(DesignTokens.successColor),
              minHeight: 6.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBiometricSection() {
    return Card(
      elevation: DesignTokens.elevation1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
      ),
      child: Padding(
        padding: const EdgeInsets.all(DesignTokens.spaceMD),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Biometric Authentication',
              style: TextStyle(
                fontSize: DesignTokens.fontSizeLG,
                fontWeight: DesignTokens.fontWeightSemiBold,
                color: DesignTokens.textPrimary,
              ),
            ),
            const SizedBox(height: DesignTokens.spaceMD),
            
            // Fingerprint
            ListTile(
              leading: const Icon(
                Icons.fingerprint,
                color: DesignTokens.primaryColor,
                size: DesignTokens.iconMD,
              ),
              title: const Text('Fingerprint'),
              subtitle: const Text('Use your fingerprint to unlock'),
              trailing: Switch(
                value: true, // Mock value
                onChanged: _toggleFingerprint,
                activeColor: DesignTokens.primaryColor,
              ),
            ),
            
            // Face ID
            ListTile(
              leading: const Icon(
                Icons.face,
                color: DesignTokens.primaryColor,
                size: DesignTokens.iconMD,
              ),
              title: const Text('Face Recognition'),
              subtitle: const Text('Use face recognition to unlock'),
              trailing: Switch(
                value: false, // Mock value
                onChanged: _toggleFaceId,
                activeColor: DesignTokens.primaryColor,
              ),
            ),
            
            // Fallback option
            ListTile(
              leading: const Icon(
                Icons.lock_outline,
                color: DesignTokens.textSecondary,
                size: DesignTokens.iconMD,
              ),
              title: const Text('Fallback to PIN'),
              subtitle: const Text('Use PIN if biometric fails'),
              trailing: Switch(
                value: true, // Mock value
                onChanged: _toggleFallback,
                activeColor: DesignTokens.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPinPasswordSection() {
    return Card(
      elevation: DesignTokens.elevation1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
      ),
      child: Padding(
        padding: const EdgeInsets.all(DesignTokens.spaceMD),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'PIN & Password',
              style: TextStyle(
                fontSize: DesignTokens.fontSizeLG,
                fontWeight: DesignTokens.fontWeightSemiBold,
                color: DesignTokens.textPrimary,
              ),
            ),
            const SizedBox(height: DesignTokens.spaceMD),
            
            ListTile(
              leading: const Icon(
                Icons.pin,
                color: DesignTokens.primaryColor,
                size: DesignTokens.iconMD,
              ),
              title: const Text('Change PIN'),
              subtitle: const Text('Last changed 3 months ago'),
              trailing: const Icon(Icons.chevron_right),
              onTap: _changePIN,
            ),
            
            ListTile(
              leading: const Icon(
                Icons.password,
                color: DesignTokens.primaryColor,
                size: DesignTokens.iconMD,
              ),
              title: const Text('Change Password'),
              subtitle: const Text('Last changed 6 months ago'),
              trailing: const Icon(Icons.chevron_right),
              onTap: _changePassword,
            ),
            
            ListTile(
              leading: const Icon(
                Icons.timer,
                color: DesignTokens.textSecondary,
                size: DesignTokens.iconMD,
              ),
              title: const Text('Auto-lock Timer'),
              subtitle: const Text('Lock app after 5 minutes'),
              trailing: const Icon(Icons.chevron_right),
              onTap: _configureAutoLock,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSessionSection() {
    return Card(
      elevation: DesignTokens.elevation1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
      ),
      child: Padding(
        padding: const EdgeInsets.all(DesignTokens.spaceMD),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Active Sessions',
              style: TextStyle(
                fontSize: DesignTokens.fontSizeLG,
                fontWeight: DesignTokens.fontWeightSemiBold,
                color: DesignTokens.textPrimary,
              ),
            ),
            const SizedBox(height: DesignTokens.spaceMD),
            
            // Current device
            ListTile(
              leading: const Icon(
                Icons.smartphone,
                color: DesignTokens.successColor,
                size: DesignTokens.iconMD,
              ),
              title: const Text('This Device'),
              subtitle: const Text('Active now • Samsung Galaxy S21'),
              trailing: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: DesignTokens.spaceSM,
                  vertical: DesignTokens.spaceXXS,
                ),
                decoration: BoxDecoration(
                  color: DesignTokens.successColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(DesignTokens.radiusSM),
                ),
                child: const Text(
                  'CURRENT',
                  style: TextStyle(
                    color: DesignTokens.successColor,
                    fontWeight: DesignTokens.fontWeightMedium,
                    fontSize: DesignTokens.fontSizeXS,
                  ),
                ),
              ),
            ),
            
            // Other devices (mock data)
            ListTile(
              leading: const Icon(
                Icons.laptop,
                color: DesignTokens.textSecondary,
                size: DesignTokens.iconMD,
              ),
              title: const Text('Web Browser'),
              subtitle: const Text('2 hours ago • Chrome on Windows'),
              trailing: TextButton(
                onPressed: () => _revokeSession('web'),
                child: const Text(
                  'REVOKE',
                  style: TextStyle(
                    color: DesignTokens.errorColor,
                    fontWeight: DesignTokens.fontWeightMedium,
                    fontSize: DesignTokens.fontSizeXS,
                  ),
                ),
              ),
            ),
            
            const SizedBox(height: DesignTokens.spaceMD),
            
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _revokeAllSessions,
                style: ElevatedButton.styleFrom(
                  backgroundColor: DesignTokens.errorColor,
                  foregroundColor: DesignTokens.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
                  ),
                ),
                child: const Text('Revoke All Other Sessions'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPrivacyTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(DesignTokens.spaceMD),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Data Usage
          _buildDataUsageSection(),
          
          const SizedBox(height: DesignTokens.spaceLG),
          
          // Privacy Controls
          _buildPrivacyControlsSection(),
          
          const SizedBox(height: DesignTokens.spaceLG),
          
          // GDPR Compliance
          _buildGDPRSection(),
        ],
      ),
    );
  }

  Widget _buildDataUsageSection() {
    return Card(
      elevation: DesignTokens.elevation1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
      ),
      child: Padding(
        padding: const EdgeInsets.all(DesignTokens.spaceMD),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Data Usage',
              style: TextStyle(
                fontSize: DesignTokens.fontSizeLG,
                fontWeight: DesignTokens.fontWeightSemiBold,
                color: DesignTokens.textPrimary,
              ),
            ),
            const SizedBox(height: DesignTokens.spaceMD),
            
            ListTile(
              leading: const Icon(
                Icons.analytics_outlined,
                color: DesignTokens.primaryColor,
                size: DesignTokens.iconMD,
              ),
              title: const Text('Analytics Data'),
              subtitle: const Text('Help improve the app with usage analytics'),
              trailing: Switch(
                value: false, // Mock value - disabled by default
                onChanged: _toggleAnalytics,
                activeColor: DesignTokens.primaryColor,
              ),
            ),
            
            ListTile(
              leading: const Icon(
                Icons.bug_report_outlined,
                color: DesignTokens.primaryColor,
                size: DesignTokens.iconMD,
              ),
              title: const Text('Crash Reporting'),
              subtitle: const Text('Send crash reports to improve stability'),
              trailing: Switch(
                value: false, // Mock value - disabled by default
                onChanged: _toggleCrashReporting,
                activeColor: DesignTokens.primaryColor,
              ),
            ),
            
            ListTile(
              leading: const Icon(
                Icons.location_on_outlined,
                color: DesignTokens.primaryColor,
                size: DesignTokens.iconMD,
              ),
              title: const Text('Location Sharing'),
              subtitle: const Text('Share location for delivery services'),
              trailing: Switch(
                value: true, // Mock value - enabled for core functionality
                onChanged: _toggleLocationSharing,
                activeColor: DesignTokens.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPrivacyControlsSection() {
    return Card(
      elevation: DesignTokens.elevation1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
      ),
      child: Padding(
        padding: const EdgeInsets.all(DesignTokens.spaceMD),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Privacy Controls',
              style: TextStyle(
                fontSize: DesignTokens.fontSizeLG,
                fontWeight: DesignTokens.fontWeightSemiBold,
                color: DesignTokens.textPrimary,
              ),
            ),
            const SizedBox(height: DesignTokens.spaceMD),
            
            ListTile(
              leading: const Icon(
                Icons.email_outlined,
                color: DesignTokens.primaryColor,
                size: DesignTokens.iconMD,
              ),
              title: const Text('Marketing Emails'),
              subtitle: const Text('Receive promotional emails and offers'),
              trailing: Switch(
                value: true, // Mock value
                onChanged: _toggleMarketingEmails,
                activeColor: DesignTokens.primaryColor,
              ),
            ),
            
            ListTile(
              leading: const Icon(
                Icons.notifications_outlined,
                color: DesignTokens.primaryColor,
                size: DesignTokens.iconMD,
              ),
              title: const Text('Push Notifications'),
              subtitle: const Text('Receive app notifications'),
              trailing: Switch(
                value: true, // Mock value
                onChanged: _togglePushNotifications,
                activeColor: DesignTokens.primaryColor,
              ),
            ),
            
            ListTile(
              leading: const Icon(
                Icons.visibility_off_outlined,
                color: DesignTokens.primaryColor,
                size: DesignTokens.iconMD,
              ),
              title: const Text('Profile Visibility'),
              subtitle: const Text('Control who can see your profile'),
              trailing: const Icon(Icons.chevron_right),
              onTap: _configureProfileVisibility,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGDPRSection() {
    return Card(
      elevation: DesignTokens.elevation1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
      ),
      child: Padding(
        padding: const EdgeInsets.all(DesignTokens.spaceMD),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Data Rights (GDPR)',
              style: TextStyle(
                fontSize: DesignTokens.fontSizeLG,
                fontWeight: DesignTokens.fontWeightSemiBold,
                color: DesignTokens.textPrimary,
              ),
            ),
            const SizedBox(height: DesignTokens.spaceMD),
            
            ListTile(
              leading: const Icon(
                Icons.download_outlined,
                color: DesignTokens.infoColor,
                size: DesignTokens.iconMD,
              ),
              title: const Text('Export My Data'),
              subtitle: const Text('Download a copy of your data'),
              trailing: const Icon(Icons.chevron_right),
              onTap: _exportData,
            ),
            
            ListTile(
              leading: const Icon(
                Icons.delete_outline,
                color: DesignTokens.errorColor,
                size: DesignTokens.iconMD,
              ),
              title: const Text('Delete My Account'),
              subtitle: const Text('Permanently delete your account and data'),
              trailing: const Icon(Icons.chevron_right),
              onTap: _requestAccountDeletion,
            ),
            
            ListTile(
              leading: const Icon(
                Icons.policy_outlined,
                color: DesignTokens.textSecondary,
                size: DesignTokens.iconMD,
              ),
              title: const Text('Privacy Policy'),
              subtitle: const Text('Read our privacy policy'),
              trailing: const Icon(Icons.chevron_right),
              onTap: _viewPrivacyPolicy,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSecurityTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(DesignTokens.spaceMD),
      child: Column(
        children: [
          // Data Encryption
          _buildEncryptionSection(),
          
          const SizedBox(height: DesignTokens.spaceLG),
          
          // Fraud Detection
          _buildFraudDetectionSection(),
          
          const SizedBox(height: DesignTokens.spaceLG),
          
          // Security Scan
          _buildSecurityScanSection(),
        ],
      ),
    );
  }

  Widget _buildEncryptionSection() {
    return Card(
      elevation: DesignTokens.elevation1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
      ),
      child: Padding(
        padding: const EdgeInsets.all(DesignTokens.spaceMD),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.enhanced_encryption,
                  color: DesignTokens.successColor,
                  size: DesignTokens.iconMD,
                ),
                const SizedBox(width: DesignTokens.spaceSM),
                const Text(
                  'Data Encryption',
                  style: TextStyle(
                    fontSize: DesignTokens.fontSizeLG,
                    fontWeight: DesignTokens.fontWeightSemiBold,
                    color: DesignTokens.textPrimary,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: DesignTokens.spaceSM,
                    vertical: DesignTokens.spaceXXS,
                  ),
                  decoration: BoxDecoration(
                    color: DesignTokens.successColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(DesignTokens.radiusSM),
                  ),
                  child: const Text(
                    'ENABLED',
                    style: TextStyle(
                      color: DesignTokens.successColor,
                      fontWeight: DesignTokens.fontWeightMedium,
                      fontSize: DesignTokens.fontSizeXS,
                    ),
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: DesignTokens.spaceMD),
            
            const Text(
              'Your data is encrypted using AES-256 encryption. This includes personal information, payment data, and communication.',
              style: TextStyle(
                color: DesignTokens.textSecondary,
                fontSize: DesignTokens.fontSizeSM,
              ),
            ),
            
            const SizedBox(height: DesignTokens.spaceMD),
            
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Encryption Method',
                      style: TextStyle(
                        color: DesignTokens.textSecondary,
                        fontSize: DesignTokens.fontSizeSM,
                      ),
                    ),
                    Text(
                      'AES-256',
                      style: TextStyle(
                        fontWeight: DesignTokens.fontWeightMedium,
                        color: DesignTokens.textPrimary,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Last Key Rotation',
                      style: TextStyle(
                        color: DesignTokens.textSecondary,
                        fontSize: DesignTokens.fontSizeSM,
                      ),
                    ),
                    Text(
                      '2 weeks ago',
                      style: TextStyle(
                        fontWeight: DesignTokens.fontWeightMedium,
                        color: DesignTokens.textPrimary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFraudDetectionSection() {
    return Card(
      elevation: DesignTokens.elevation1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
      ),
      child: Padding(
        padding: const EdgeInsets.all(DesignTokens.spaceMD),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Fraud Detection',
              style: TextStyle(
                fontSize: DesignTokens.fontSizeLG,
                fontWeight: DesignTokens.fontWeightSemiBold,
                color: DesignTokens.textPrimary,
              ),
            ),
            const SizedBox(height: DesignTokens.spaceMD),
            
            ListTile(
              leading: const Icon(
                Icons.security,
                color: DesignTokens.primaryColor,
                size: DesignTokens.iconMD,
              ),
              title: const Text('Real-time Monitoring'),
              subtitle: const Text('Monitor for suspicious activities'),
              trailing: Switch(
                value: true, // Mock value
                onChanged: _toggleFraudDetection,
                activeColor: DesignTokens.primaryColor,
              ),
            ),
            
            ListTile(
              leading: const Icon(
                Icons.location_searching,
                color: DesignTokens.primaryColor,
                size: DesignTokens.iconMD,
              ),
              title: const Text('Location Anomaly Detection'),
              subtitle: const Text('Detect unusual login locations'),
              trailing: Switch(
                value: true, // Mock value
                onChanged: _toggleLocationAnomalyDetection,
                activeColor: DesignTokens.primaryColor,
              ),
            ),
            
            ListTile(
              leading: const Icon(
                Icons.devices,
                color: DesignTokens.primaryColor,
                size: DesignTokens.iconMD,
              ),
              title: const Text('Device Recognition'),
              subtitle: const Text('Alert on new device access'),
              trailing: Switch(
                value: true, // Mock value
                onChanged: _toggleDeviceRecognition,
                activeColor: DesignTokens.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSecurityScanSection() {
    return Card(
      elevation: DesignTokens.elevation1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
      ),
      child: Padding(
        padding: const EdgeInsets.all(DesignTokens.spaceMD),
        child: Column(
          children: [
            const Icon(
              Icons.shield_outlined,
              size: DesignTokens.iconXL,
              color: DesignTokens.primaryColor,
            ),
            const SizedBox(height: DesignTokens.spaceMD),
            const Text(
              'Security Scan',
              style: TextStyle(
                fontSize: DesignTokens.fontSizeLG,
                fontWeight: DesignTokens.fontWeightSemiBold,
                color: DesignTokens.textPrimary,
              ),
            ),
            const SizedBox(height: DesignTokens.spaceSM),
            const Text(
              'Run a comprehensive security check on your account',
              style: TextStyle(
                color: DesignTokens.textSecondary,
                fontSize: DesignTokens.fontSizeSM,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: DesignTokens.spaceLG),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _runSecurityScan,
                style: ElevatedButton.styleFrom(
                  backgroundColor: DesignTokens.primaryColor,
                  foregroundColor: DesignTokens.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
                  ),
                ),
                child: const Text('Run Security Scan'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAlertsTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(DesignTokens.spaceMD),
      itemCount: 6,
      itemBuilder: (context, index) {
        final alerts = [
          _SecurityAlertMock('New Device Access', 'Login from new iPhone detected', SecurityAlertSeverity.medium),
          _SecurityAlertMock('Suspicious Activity', 'Multiple failed login attempts', SecurityAlertSeverity.high),
          _SecurityAlertMock('Location Anomaly', 'Login from unusual location: Paris', SecurityAlertSeverity.low),
          _SecurityAlertMock('Password Change', 'Password was successfully changed', SecurityAlertSeverity.info),
          _SecurityAlertMock('Data Export Request', 'Data export was completed', SecurityAlertSeverity.info),
          _SecurityAlertMock('Fraud Attempt Blocked', 'Suspicious transaction blocked', SecurityAlertSeverity.critical),
        ];
        
        final alert = alerts[index];
        return Card(
          margin: const EdgeInsets.only(bottom: DesignTokens.spaceMD),
          elevation: DesignTokens.elevation1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
          ),
          child: ListTile(
            leading: Icon(
              _getAlertIcon(alert.severity),
              color: _getAlertColor(alert.severity),
              size: DesignTokens.iconMD,
            ),
            title: Text(
              alert.title,
              style: const TextStyle(
                fontWeight: DesignTokens.fontWeightMedium,
                color: DesignTokens.textPrimary,
              ),
            ),
            subtitle: Text(
              alert.description,
              style: const TextStyle(
                color: DesignTokens.textSecondary,
                fontSize: DesignTokens.fontSizeSM,
              ),
            ),
            trailing: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: DesignTokens.spaceSM,
                vertical: DesignTokens.spaceXXS,
              ),
              decoration: BoxDecoration(
                color: _getAlertColor(alert.severity).withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(DesignTokens.radiusSM),
              ),
              child: Text(
                alert.severity.name.toUpperCase(),
                style: TextStyle(
                  color: _getAlertColor(alert.severity),
                  fontWeight: DesignTokens.fontWeightMedium,
                  fontSize: DesignTokens.fontSizeXS,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  IconData _getAlertIcon(SecurityAlertSeverity severity) {
    switch (severity) {
      case SecurityAlertSeverity.info:
        return Icons.info_outline;
      case SecurityAlertSeverity.low:
        return Icons.notification_important_outlined;
      case SecurityAlertSeverity.medium:
        return Icons.warning_outlined;
      case SecurityAlertSeverity.high:
        return Icons.error_outline;
      case SecurityAlertSeverity.critical:
        return Icons.dangerous_outlined;
    }
  }

  Color _getAlertColor(SecurityAlertSeverity severity) {
    switch (severity) {
      case SecurityAlertSeverity.info:
        return DesignTokens.infoColor;
      case SecurityAlertSeverity.low:
        return DesignTokens.primaryColor;
      case SecurityAlertSeverity.medium:
        return DesignTokens.warningColor;
      case SecurityAlertSeverity.high:
        return Colors.orange;
      case SecurityAlertSeverity.critical:
        return DesignTokens.errorColor;
    }
  }

  // Mock implementation methods
  void _showSecurityScan() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Security Scan'),
        content: const Text('This will scan your account for security vulnerabilities.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _runSecurityScan();
            },
            child: const Text('Start Scan'),
          ),
        ],
      ),
    );
  }

  void _toggleFingerprint(bool value) {
    // Mock implementation
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Fingerprint ${value ? 'enabled' : 'disabled'}')),
    );
  }

  void _toggleFaceId(bool value) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Face ID ${value ? 'enabled' : 'disabled'}')),
    );
  }

  void _toggleFallback(bool value) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('PIN fallback ${value ? 'enabled' : 'disabled'}')),
    );
  }

  void _changePIN() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('PIN change screen would open here')),
    );
  }

  void _changePassword() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Password change screen would open here')),
    );
  }

  void _configureAutoLock() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Auto-lock configuration would open here')),
    );
  }

  void _revokeSession(String sessionId) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Session $sessionId revoked')),
    );
  }

  void _revokeAllSessions() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('All other sessions revoked')),
    );
  }

  void _toggleAnalytics(bool value) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Analytics ${value ? 'enabled' : 'disabled'}')),
    );
  }

  void _toggleCrashReporting(bool value) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Crash reporting ${value ? 'enabled' : 'disabled'}')),
    );
  }

  void _toggleLocationSharing(bool value) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Location sharing ${value ? 'enabled' : 'disabled'}')),
    );
  }

  void _toggleMarketingEmails(bool value) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Marketing emails ${value ? 'enabled' : 'disabled'}')),
    );
  }

  void _togglePushNotifications(bool value) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Push notifications ${value ? 'enabled' : 'disabled'}')),
    );
  }

  void _configureProfileVisibility() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Profile visibility settings would open here')),
    );
  }

  void _exportData() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Data export initiated')),
    );
  }

  void _requestAccountDeletion() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Account'),
        content: const Text('This action cannot be undone. All your data will be permanently deleted.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Account deletion request submitted')),
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: DesignTokens.errorColor),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  void _viewPrivacyPolicy() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Privacy policy would open here')),
    );
  }

  void _toggleFraudDetection(bool value) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Fraud detection ${value ? 'enabled' : 'disabled'}')),
    );
  }

  void _toggleLocationAnomalyDetection(bool value) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Location anomaly detection ${value ? 'enabled' : 'disabled'}')),
    );
  }

  void _toggleDeviceRecognition(bool value) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Device recognition ${value ? 'enabled' : 'disabled'}')),
    );
  }

  void _runSecurityScan() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Running security scan...')),
    );
  }
}

class _SecurityAlertMock {
  final String title;
  final String description;
  final SecurityAlertSeverity severity;

  _SecurityAlertMock(this.title, this.description, this.severity);
}
