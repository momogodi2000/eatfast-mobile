import 'package:flutter/material.dart';
import '../../domain/models/two_factor_auth.dart';

class TrustedDevicesWidget extends StatelessWidget {
  final List<TrustedDevice> devices;
  final Function(String)? onRemoveDevice;

  const TrustedDevicesWidget({
    super.key,
    required this.devices,
    this.onRemoveDevice,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Appareils de confiance',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Ces appareils ne vous demanderont pas de code 2FA lors de la connexion.',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Colors.grey.shade600,
          ),
        ),
        const SizedBox(height: 16),
        if (devices.isEmpty)
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: Text('Aucun appareil de confiance configuré'),
            ),
          )
        else
          ...devices.map((device) => _buildDeviceCard(context, device)),
      ],
    );
  }

  Widget _buildDeviceCard(BuildContext context, TrustedDevice device) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(
              _getDeviceIcon(device.deviceType),
              size: 32,
              color: device.isActive ? Colors.green : Colors.grey,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    device.name,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Ajouté le ${_formatDate(device.addedAt)}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.grey.shade600,
                    ),
                  ),
                  if (device.location != null)
                    Text(
                      device.location!,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.grey.shade500,
                      ),
                    ),
                ],
              ),
            ),
            if (onRemoveDevice != null)
              IconButton(
                onPressed: () => onRemoveDevice!(device.id),
                icon: const Icon(Icons.delete, color: Colors.red),
              ),
          ],
        ),
      ),
    );
  }

  IconData _getDeviceIcon(String deviceType) {
    switch (deviceType.toLowerCase()) {
      case 'mobile':
      case 'phone':
        return Icons.phone_android;
      case 'tablet':
        return Icons.tablet;
      case 'desktop':
      case 'computer':
        return Icons.computer;
      default:
        return Icons.device_unknown;
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}