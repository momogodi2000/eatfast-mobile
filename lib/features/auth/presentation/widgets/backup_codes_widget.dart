import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BackupCodesWidget extends StatelessWidget {
  final List<String> backupCodes;
  final VoidCallback? onRegenerate;

  const BackupCodesWidget({
    super.key,
    required this.backupCodes,
    this.onRegenerate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Codes de récupération',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Conservez ces codes en lieu sûr. Ils vous permettront d\'accéder à votre compte si vous perdez votre téléphone.',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Colors.grey.shade600,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: backupCodes.map((code) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      code,
                      style: const TextStyle(
                        fontFamily: 'monospace',
                        fontSize: 16,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: code));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Code copié')),
                      );
                    },
                    icon: const Icon(Icons.copy, size: 20),
                  ),
                ],
              ),
            )).toList(),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            OutlinedButton(
              onPressed: () {
                final codesText = backupCodes.join('\n');
                Clipboard.setData(ClipboardData(text: codesText));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Tous les codes copiés')),
                );
              },
              child: const Text('Copier tous'),
            ),
            const SizedBox(width: 12),
            if (onRegenerate != null)
              ElevatedButton(
                onPressed: onRegenerate,
                child: const Text('Régénérer'),
              ),
          ],
        ),
      ],
    );
  }
}