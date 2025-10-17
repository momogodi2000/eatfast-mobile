import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../domain/models/whatsapp_message.dart';
import '../providers/whatsapp_provider.dart';
import 'package:eatfast_mobile/shared/widgets/common/loading_widget.dart';

class WhatsAppIntegrationWidget extends ConsumerStatefulWidget {
  final String? orderId;
  final String? restaurantId;
  final WhatsAppContext context;

  const WhatsAppIntegrationWidget({
    super.key,
    this.orderId,
    this.restaurantId,
    required this.context,
  });

  @override
  ConsumerState<WhatsAppIntegrationWidget> createState() => _WhatsAppIntegrationWidgetState();
}

class _WhatsAppIntegrationWidgetState extends ConsumerState<WhatsAppIntegrationWidget> {
  @override
  Widget build(BuildContext context) {
    final whatsappState = ref.watch(whatsappProvider);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF25D366).withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.asset(
                    'assets/icons/whatsapp.png',
                    width: 24,
                    height: 24,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Support WhatsApp',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Obtenez de l\'aide instantanée',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildQuickActions(context),
            if (widget.orderId != null) ...[
              const SizedBox(height: 16),
              _buildOrderSpecificActions(),
            ],
            if (whatsappState.isLoading) ...[
              const SizedBox(height: 16),
              const LoadingWidget(),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Column(
      children: [
        _buildActionButton(
          icon: Icons.support_agent,
          title: 'Support client',
          subtitle: 'Parlez à un agent',
          onTap: () => _startSupportChat(),
        ),
        const SizedBox(height: 8),
        _buildActionButton(
          icon: Icons.restaurant,
          title: 'Contacter le restaurant',
          subtitle: 'Questions sur votre commande',
          onTap: widget.restaurantId != null ? () => _contactRestaurant() : null,
        ),
        const SizedBox(height: 8),
        _buildActionButton(
          icon: Icons.delivery_dining,
          title: 'Contacter le livreur',
          subtitle: 'Suivi de livraison',
          onTap: widget.orderId != null ? () => _contactDriver() : null,
        ),
      ],
    );
  }

  Widget _buildOrderSpecificActions() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Actions rapides pour cette commande',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade700,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildQuickActionChip(
                  icon: Icons.access_time,
                  label: 'Délai de livraison',
                  onTap: () => _askAboutDeliveryTime(),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildQuickActionChip(
                  icon: Icons.edit,
                  label: 'Modifier commande',
                  onTap: () => _requestOrderModification(),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: _buildQuickActionChip(
                  icon: Icons.cancel,
                  label: 'Annuler',
                  onTap: () => _requestCancellation(),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildQuickActionChip(
                  icon: Icons.help,
                  label: 'Problème',
                  onTap: () => _reportIssue(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: onTap != null ? const Color(0xFF25D366) : Colors.grey,
              size: 24,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: onTap != null ? null : Colors.grey,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: onTap != null ? Colors.grey : Colors.grey.shade400,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActionChip({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16, color: const Color(0xFF25D366)),
            const SizedBox(width: 6),
            Flexible(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _startSupportChat() async {
    try {
      final message = await ref.read(whatsappProvider.notifier).createSupportMessage(
        orderId: widget.orderId,
      );
      await _openWhatsApp(message);
    } catch (error) {
      _showErrorSnackBar(error.toString());
    }
  }

  void _contactRestaurant() async {
    if (widget.restaurantId == null) return;

    try {
      final message = await ref.read(whatsappProvider.notifier).createRestaurantMessage(
        restaurantPhone: '+237123456789', // TODO: Get actual restaurant phone
        orderId: widget.orderId,
      );
      await _openWhatsApp(message);
    } catch (error) {
      _showErrorSnackBar(error.toString());
    }
  }

  void _contactDriver() async {
    if (widget.orderId == null) return;

    try {
      final message = await ref.read(whatsappProvider.notifier).createDriverMessage(
        driverPhone: '+237123456789', // TODO: Get actual driver phone
        orderId: widget.orderId,
      );
      await _openWhatsApp(message);
    } catch (error) {
      _showErrorSnackBar(error.toString());
    }
  }

  void _askAboutDeliveryTime() async {
    final message = await ref.read(whatsappProvider.notifier).createTemplateMessage(
      phoneNumber: '+237123456789', // TODO: Get actual support phone
      template: WhatsAppTemplate.deliveryInquiry,
      orderId: widget.orderId,
    );
    await _openWhatsApp(message);
  }

  void _requestOrderModification() async {
    final message = await ref.read(whatsappProvider.notifier).createTemplateMessage(
      phoneNumber: '+237123456789', // TODO: Get actual support phone
      template: WhatsAppTemplate.orderModification,
      orderId: widget.orderId,
    );
    await _openWhatsApp(message);
  }

  void _requestCancellation() async {
    final message = await ref.read(whatsappProvider.notifier).createTemplateMessage(
      phoneNumber: '+237123456789', // TODO: Get actual support phone
      template: WhatsAppTemplate.cancellationRequest,
      orderId: widget.orderId,
    );
    await _openWhatsApp(message);
  }

  void _reportIssue() async {
    final message = await ref.read(whatsappProvider.notifier).createTemplateMessage(
      phoneNumber: '+237123456789', // TODO: Get actual support phone
      template: WhatsAppTemplate.issueReport,
      orderId: widget.orderId,
    );
    await _openWhatsApp(message);
  }

  Future<void> _openWhatsApp(WhatsAppMessage message) async {
    try {
      final uri = Uri.parse(message.whatsappUrl);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);

        // Track WhatsApp interaction
        await ref.read(whatsappProvider.notifier).trackInteraction(
          message.template.toString(),
        );
      } else {
        _showErrorSnackBar('Impossible d\'ouvrir WhatsApp');
      }
    } catch (error) {
      _showErrorSnackBar('Erreur lors de l\'ouverture de WhatsApp');
    }
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

class WhatsAppQuickContact extends StatelessWidget {
  final String phoneNumber;
  final String? initialMessage;
  final IconData? icon;
  final String? label;

  const WhatsAppQuickContact({
    super.key,
    required this.phoneNumber,
    this.initialMessage,
    this.icon,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _openWhatsApp(),
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: const Color(0xFF25D366),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon ?? Icons.chat,
              color: Colors.white,
              size: 16,
            ),
            if (label != null) ...[
              const SizedBox(width: 6),
              Text(
                label!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  void _openWhatsApp() async {
    final message = initialMessage != null
        ? Uri.encodeComponent(initialMessage!)
        : '';
    final url = 'https://wa.me/$phoneNumber?text=$message';
    final uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
