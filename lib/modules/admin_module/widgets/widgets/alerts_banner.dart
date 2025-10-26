import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AlertsBanner extends ConsumerWidget {
  const AlertsBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Mock alerts - in real app, these would come from a provider
    final alerts = [
      _SystemAlert(
        id: '1',
        type: AlertType.warning,
        message: '12 tickets de support en attente de traitement',
        action: 'Gérer',
        onActionPressed: () {
          // Navigate to support tickets
        },
      ),
      _SystemAlert(
        id: '2',
        type: AlertType.info,
        message: '5 nouveaux restaurants en attente de validation',
        action: 'Valider',
        onActionPressed: () {
          // Navigate to restaurant validation
        },
      ),
    ];

    if (alerts.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
          ),
        ),
      ),
      child: Column(
        children: alerts.map((alert) => _AlertItem(alert: alert)).toList(),
      ),
    );
  }
}

class _AlertItem extends StatefulWidget {
  final _SystemAlert alert;

  const _AlertItem({required this.alert});

  @override
  State<_AlertItem> createState() => _AlertItemState();
}

class _AlertItemState extends State<_AlertItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  bool _dismissed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_dismissed) {
      return const SizedBox.shrink();
    }

    final theme = Theme.of(context);
    final alertColor = _getAlertColor(widget.alert.type);

    return AnimatedBuilder(
      animation: _fadeAnimation,
      builder: (context, child) {
        return Opacity(
          opacity: 1.0 - _fadeAnimation.value,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: alertColor.withValues(alpha: 0.1),
              border: Border(
                left: BorderSide(
                  color: alertColor,
                  width: 4,
                ),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  _getAlertIcon(widget.alert.type),
                  color: alertColor,
                  size: 18,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    widget.alert.message,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: alertColor.withValues(alpha: 0.9),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                if (widget.alert.action != null && widget.alert.onActionPressed != null)
                  TextButton(
                    onPressed: widget.alert.onActionPressed,
                    style: TextButton.styleFrom(
                      foregroundColor: alertColor,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      widget.alert.action!,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: _dismissAlert,
                  child: Icon(
                    Icons.close,
                    color: alertColor.withValues(alpha: 0.7),
                    size: 16,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _dismissAlert() {
    _controller.forward().then((_) {
      if (mounted) {
        setState(() {
          _dismissed = true;
        });
      }
    });
  }

  Color _getAlertColor(AlertType type) {
    switch (type) {
      case AlertType.info:
        return Colors.blue;
      case AlertType.warning:
        return Colors.orange;
      case AlertType.error:
        return Colors.red;
      case AlertType.success:
        return Colors.green;
    }
  }

  IconData _getAlertIcon(AlertType type) {
    switch (type) {
      case AlertType.info:
        return Icons.info;
      case AlertType.warning:
        return Icons.warning;
      case AlertType.error:
        return Icons.error;
      case AlertType.success:
        return Icons.check_circle;
    }
  }
}

class _SystemAlert {
  final String id;
  final AlertType type;
  final String message;
  final String? action;
  final VoidCallback? onActionPressed;

  _SystemAlert({
    required this.id,
    required this.type,
    required this.message,
    this.action,
    this.onActionPressed,
  });
}

enum AlertType {
  info,
  warning,
  error,
  success,
}
