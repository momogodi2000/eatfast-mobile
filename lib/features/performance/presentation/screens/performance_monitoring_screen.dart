import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/design_tokens.dart';
import '../../domain/models/app_performance.dart';

class PerformanceMonitoringScreen extends ConsumerStatefulWidget {
  const PerformanceMonitoringScreen({super.key});

  @override
  ConsumerState<PerformanceMonitoringScreen> createState() => _PerformanceMonitoringScreenState();
}

class _PerformanceMonitoringScreenState extends ConsumerState<PerformanceMonitoringScreen>
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
          'Performance Monitoring',
          style: TextStyle(
            fontWeight: DesignTokens.fontWeightSemiBold,
            color: DesignTokens.textPrimary,
          ),
        ),
        backgroundColor: DesignTokens.backgroundPrimary,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: DesignTokens.primaryColor),
            onPressed: _refreshMetrics,
          ),
          IconButton(
            icon: const Icon(Icons.settings, color: DesignTokens.textSecondary),
            onPressed: _openSettings,
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: DesignTokens.primaryColor,
          unselectedLabelColor: DesignTokens.textSecondary,
          indicatorColor: DesignTokens.primaryColor,
          tabs: const [
            Tab(icon: Icon(Icons.speed), text: 'Real-time'),
            Tab(icon: Icon(Icons.trending_up), text: 'Trends'),
            Tab(icon: Icon(Icons.warning), text: 'Alerts'),
            Tab(icon: Icon(Icons.analytics), text: 'Reports'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildRealTimeTab(),
          _buildTrendsTab(),
          _buildAlertsTab(),
          _buildReportsTab(),
        ],
      ),
    );
  }

  Widget _buildRealTimeTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(DesignTokens.spaceMD),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // System Health Overview
          _buildHealthOverview(),
          
          const SizedBox(height: DesignTokens.spaceLG),
          
          // Performance Metrics Grid
          _buildMetricsGrid(),
          
          const SizedBox(height: DesignTokens.spaceLG),
          
          // Network Activity
          _buildNetworkActivity(),
          
          const SizedBox(height: DesignTokens.spaceLG),
          
          // Error Tracking
          _buildErrorTracking(),
        ],
      ),
    );
  }

  Widget _buildHealthOverview() {
    return Card(
      elevation: DesignTokens.elevation2,
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
                Icon(
                  Icons.health_and_safety,
                  color: DesignTokens.successColor,
                  size: DesignTokens.iconMD,
                ),
                const SizedBox(width: DesignTokens.spaceSM),
                Text(
                  'System Health',
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
                  child: Text(
                    'Excellent',
                    style: TextStyle(
                      color: DesignTokens.successColor,
                      fontWeight: DesignTokens.fontWeightMedium,
                      fontSize: DesignTokens.fontSizeSM,
                    ),
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: DesignTokens.spaceMD),
            
            // Health Score Progress
            LinearProgressIndicator(
              value: 0.92, // Mock value
              backgroundColor: DesignTokens.lightGrey,
              valueColor: AlwaysStoppedAnimation<Color>(DesignTokens.successColor),
              minHeight: 6.0,
            ),
            
            const SizedBox(height: DesignTokens.spaceSM),
            
            Text(
              'Overall Score: 92/100',
              style: TextStyle(
                color: DesignTokens.textSecondary,
                fontSize: DesignTokens.fontSizeSM,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMetricsGrid() {
    final metrics = [
      _MetricData('CPU Usage', '23%', Icons.memory, DesignTokens.successColor),
      _MetricData('Memory', '1.2GB', Icons.storage, DesignTokens.warningColor),
      _MetricData('Battery', '4%/hr', Icons.battery_std, DesignTokens.successColor),
      _MetricData('Frame Rate', '60fps', Icons.speed, DesignTokens.successColor),
      _MetricData('Network', '125ms', Icons.network_check, DesignTokens.infoColor),
      _MetricData('Errors', '2', Icons.error_outline, DesignTokens.errorColor),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: DesignTokens.spaceMD,
        mainAxisSpacing: DesignTokens.spaceMD,
        childAspectRatio: 1.3,
      ),
      itemCount: metrics.length,
      itemBuilder: (context, index) {
        final metric = metrics[index];
        return Card(
          elevation: DesignTokens.elevation1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
          ),
          child: Padding(
            padding: const EdgeInsets.all(DesignTokens.spaceMD),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  metric.icon,
                  color: metric.color,
                  size: DesignTokens.iconLG,
                ),
                const SizedBox(height: DesignTokens.spaceSM),
                Text(
                  metric.value,
                  style: TextStyle(
                    fontSize: DesignTokens.fontSizeXL,
                    fontWeight: DesignTokens.fontWeightBold,
                    color: DesignTokens.textPrimary,
                  ),
                ),
                Text(
                  metric.title,
                  style: TextStyle(
                    color: DesignTokens.textSecondary,
                    fontSize: DesignTokens.fontSizeSM,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildNetworkActivity() {
    return Card(
      elevation: DesignTokens.elevation2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
      ),
      child: Padding(
        padding: const EdgeInsets.all(DesignTokens.spaceMD),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Network Activity',
              style: TextStyle(
                fontSize: DesignTokens.fontSizeLG,
                fontWeight: DesignTokens.fontWeightSemiBold,
                color: DesignTokens.textPrimary,
              ),
            ),
            const SizedBox(height: DesignTokens.spaceMD),
            
            // Network Stats
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNetworkStat('Requests', '1,234', Icons.send),
                _buildNetworkStat('Success', '98.5%', Icons.check_circle),
                _buildNetworkStat('Avg Time', '120ms', Icons.timer),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNetworkStat(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(
          icon,
          color: DesignTokens.infoColor,
          size: DesignTokens.iconMD,
        ),
        const SizedBox(height: DesignTokens.spaceXS),
        Text(
          value,
          style: TextStyle(
            fontSize: DesignTokens.fontSizeMD,
            fontWeight: DesignTokens.fontWeightSemiBold,
            color: DesignTokens.textPrimary,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: DesignTokens.textSecondary,
            fontSize: DesignTokens.fontSizeSM,
          ),
        ),
      ],
    );
  }

  Widget _buildErrorTracking() {
    return Card(
      elevation: DesignTokens.elevation2,
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
                Icon(
                  Icons.bug_report,
                  color: DesignTokens.errorColor,
                  size: DesignTokens.iconMD,
                ),
                const SizedBox(width: DesignTokens.spaceSM),
                Text(
                  'Recent Errors',
                  style: TextStyle(
                    fontSize: DesignTokens.fontSizeLG,
                    fontWeight: DesignTokens.fontWeightSemiBold,
                    color: DesignTokens.textPrimary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: DesignTokens.spaceMD),
            
            // Error list (mock data)
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                final errors = [
                  'Network timeout in restaurant list',
                  'JSON parsing error in menu data',
                  'Location permission denied',
                ];
                return ListTile(
                  leading: Icon(
                    Icons.error_outline,
                    color: DesignTokens.errorColor,
                    size: DesignTokens.iconSM,
                  ),
                  title: Text(
                    errors[index],
                    style: TextStyle(
                      fontSize: DesignTokens.fontSizeSM,
                      color: DesignTokens.textPrimary,
                    ),
                  ),
                  subtitle: Text(
                    '${index + 1} hour${index == 0 ? '' : 's'} ago',
                    style: TextStyle(
                      color: DesignTokens.textTertiary,
                      fontSize: DesignTokens.fontSizeXS,
                    ),
                  ),
                  trailing: Icon(
                    Icons.chevron_right,
                    color: DesignTokens.textSecondary,
                    size: DesignTokens.iconSM,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTrendsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(DesignTokens.spaceMD),
      child: Column(
        children: [
          Text(
            'Performance Trends',
            style: TextStyle(
              fontSize: DesignTokens.fontSizeXL,
              fontWeight: DesignTokens.fontWeightSemiBold,
              color: DesignTokens.textPrimary,
            ),
          ),
          const SizedBox(height: DesignTokens.spaceLG),
          
          // Mock chart placeholder
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: DesignTokens.backgroundSecondary,
              borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.show_chart,
                    size: DesignTokens.iconXL,
                    color: DesignTokens.textSecondary,
                  ),
                  const SizedBox(height: DesignTokens.spaceSM),
                  Text(
                    'Performance charts will be displayed here',
                    style: TextStyle(
                      color: DesignTokens.textSecondary,
                      fontSize: DesignTokens.fontSizeMD,
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

  Widget _buildAlertsTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(DesignTokens.spaceMD),
      itemCount: 5,
      itemBuilder: (context, index) {
        final alerts = [
          _AlertData('High Memory Usage', 'Memory usage exceeded 80%', PerformanceAlertSeverity.high),
          _AlertData('Slow Network Response', 'API response time > 2s', PerformanceAlertSeverity.medium),
          _AlertData('Frame Rate Drop', 'FPS dropped below 30', PerformanceAlertSeverity.low),
          _AlertData('Battery Drain Alert', 'High battery consumption detected', PerformanceAlertSeverity.medium),
          _AlertData('Error Rate Spike', 'Error rate increased by 200%', PerformanceAlertSeverity.critical),
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
              Icons.warning,
              color: _getAlertColor(alert.severity),
              size: DesignTokens.iconMD,
            ),
            title: Text(
              alert.title,
              style: TextStyle(
                fontWeight: DesignTokens.fontWeightMedium,
                color: DesignTokens.textPrimary,
              ),
            ),
            subtitle: Text(
              alert.description,
              style: TextStyle(
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

  Widget _buildReportsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(DesignTokens.spaceMD),
      child: Column(
        children: [
          Text(
            'Performance Reports',
            style: TextStyle(
              fontSize: DesignTokens.fontSizeXL,
              fontWeight: DesignTokens.fontWeightSemiBold,
              color: DesignTokens.textPrimary,
            ),
          ),
          const SizedBox(height: DesignTokens.spaceLG),
          
          // Report options
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: DesignTokens.spaceMD,
            mainAxisSpacing: DesignTokens.spaceMD,
            children: [
              _buildReportCard('Daily Report', Icons.today, 'Last 24 hours'),
              _buildReportCard('Weekly Report', Icons.date_range, 'Last 7 days'),
              _buildReportCard('Monthly Report', Icons.calendar_month, 'Last 30 days'),
              _buildReportCard('Custom Range', Icons.tune, 'Select dates'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildReportCard(String title, IconData icon, String subtitle) {
    return Card(
      elevation: DesignTokens.elevation1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
      ),
      child: InkWell(
        onTap: () => _generateReport(title),
        borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
        child: Padding(
          padding: const EdgeInsets.all(DesignTokens.spaceMD),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: DesignTokens.iconLG,
                color: DesignTokens.primaryColor,
              ),
              const SizedBox(height: DesignTokens.spaceSM),
              Text(
                title,
                style: TextStyle(
                  fontWeight: DesignTokens.fontWeightMedium,
                  color: DesignTokens.textPrimary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: DesignTokens.spaceXS),
              Text(
                subtitle,
                style: TextStyle(
                  color: DesignTokens.textSecondary,
                  fontSize: DesignTokens.fontSizeSM,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getAlertColor(PerformanceAlertSeverity severity) {
    switch (severity) {
      case PerformanceAlertSeverity.low:
        return DesignTokens.infoColor;
      case PerformanceAlertSeverity.medium:
        return DesignTokens.warningColor;
      case PerformanceAlertSeverity.high:
        return Colors.orange;
      case PerformanceAlertSeverity.critical:
        return DesignTokens.errorColor;
    }
  }

  void _refreshMetrics() {
    // Mock refresh implementation
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Performance metrics refreshed'),
        backgroundColor: DesignTokens.successColor,
      ),
    );
  }

  void _openSettings() {
    // Mock settings implementation
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(DesignTokens.spaceLG),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Performance Settings',
              style: TextStyle(
                fontSize: DesignTokens.fontSizeLG,
                fontWeight: DesignTokens.fontWeightSemiBold,
              ),
            ),
            const SizedBox(height: DesignTokens.spaceLG),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Alert Notifications'),
              trailing: Switch(
                value: true,
                onChanged: (value) {},
              ),
            ),
            ListTile(
              leading: const Icon(Icons.schedule),
              title: const Text('Auto-refresh Interval'),
              subtitle: const Text('Every 30 seconds'),
              trailing: const Icon(Icons.chevron_right),
            ),
          ],
        ),
      ),
    );
  }

  void _generateReport(String type) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Generating $type...'),
        backgroundColor: DesignTokens.infoColor,
      ),
    );
  }
}

class _MetricData {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  _MetricData(this.title, this.value, this.icon, this.color);
}

class _AlertData {
  final String title;
  final String description;
  final PerformanceAlertSeverity severity;

  _AlertData(this.title, this.description, this.severity);
}
