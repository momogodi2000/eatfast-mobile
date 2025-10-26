import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TOTPSetupWidget extends StatelessWidget {
  final String secret;
  final String qrCodeUrl;
  final VoidCallback? onComplete;

  const TOTPSetupWidget({
    super.key,
    required this.secret,
    required this.qrCodeUrl,
    this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Configurez votre application d\'authentification',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 20),
        QrImageView(
          data: qrCodeUrl,
          version: QrVersions.auto,
          size: 200.0,
        ),
        const SizedBox(height: 20),
        Text(
          'Ou entrez ce code manuellement:',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 10),
        SelectableText(
          secret,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontFamily: 'monospace',
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        if (onComplete != null)
          ElevatedButton(
            onPressed: onComplete,
            child: const Text('Terminé'),
          ),
      ],
    );
  }
}
