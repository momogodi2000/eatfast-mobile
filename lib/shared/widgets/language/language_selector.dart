import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/services/localization/language_service.dart';
import '../../../core/theme/design_tokens.dart';

/// Language selector widget for changing app language
class LanguageSelector extends ConsumerWidget {
  final bool showTitle;
  final EdgeInsets? padding;
  final double? elevation;

  const LanguageSelector({
    super.key,
    this.showTitle = true,
    this.padding,
    this.elevation,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLanguage = ref.watch(languageProvider);
    final theme = Theme.of(context);
    
    return Card(
      elevation: elevation ?? 0,
      child: Padding(
        padding: padding ?? const EdgeInsets.all(DesignTokens.spaceMD),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (showTitle) ...[
              Text(
                'Language / Langue',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: DesignTokens.spaceMD),
            ],
            ...AppLanguage.values.map((language) {
              final isSelected = currentLanguage == language;
              return _LanguageOption(
                language: language,
                isSelected: isSelected,
                onTap: () => ref.read(languageProvider.notifier).changeLanguage(language),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class _LanguageOption extends StatelessWidget {
  final AppLanguage language;
  final bool isSelected;
  final VoidCallback onTap;

  const _LanguageOption({
    required this.language,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        width: 32,
        height: 24,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: theme.colorScheme.outline.withValues(alpha: 0.5)),
        ),
        child: Center(
          child: Text(
            _getFlagEmoji(language),
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ),
      title: Text(
        language.name,
        style: theme.textTheme.bodyLarge?.copyWith(
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
          color: isSelected ? theme.colorScheme.primary : null,
        ),
      ),
      subtitle: Text(
        language.englishName,
        style: theme.textTheme.bodySmall?.copyWith(
          color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
        ),
      ),
      trailing: isSelected
          ? Icon(
              Icons.check_circle,
              color: theme.colorScheme.primary,
              size: 24,
            )
          : Icon(
              Icons.radio_button_unchecked,
              color: theme.colorScheme.onSurface.withValues(alpha: 0.4),
              size: 24,
            ),
      onTap: onTap,
    );
  }

  String _getFlagEmoji(AppLanguage language) {
    switch (language) {
      case AppLanguage.english:
        return '🇺🇸';
      case AppLanguage.french:
        return '🇫🇷';
    }
  }
}

/// Language toggle button for quick switching
class LanguageToggleButton extends ConsumerWidget {
  final bool showFlag;
  final bool showText;

  const LanguageToggleButton({
    super.key,
    this.showFlag = true,
    this.showText = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLanguage = ref.watch(languageProvider);
    final theme = Theme.of(context);

    return IconButton(
      onPressed: () => ref.read(languageProvider.notifier).toggleLanguage(),
      tooltip: 'Change Language / Changer de langue',
      icon: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showFlag)
            Text(
              _getFlagEmoji(currentLanguage),
              style: const TextStyle(fontSize: 18),
            ),
          if (showText && showFlag) const SizedBox(width: 4),
          if (showText)
            Text(
              currentLanguage.code.toUpperCase(),
              style: theme.textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
        ],
      ),
    );
  }

  String _getFlagEmoji(AppLanguage language) {
    switch (language) {
      case AppLanguage.english:
        return '🇺🇸';
      case AppLanguage.french:
        return '🇫🇷';
    }
  }
}

/// Language selection bottom sheet
class LanguageSelectionBottomSheet extends StatelessWidget {
  const LanguageSelectionBottomSheet({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => const LanguageSelectionBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(DesignTokens.spaceLG),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'Select Language',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          const SizedBox(height: DesignTokens.spaceMD),
          const LanguageSelector(
            showTitle: false,
            padding: EdgeInsets.zero,
          ),
          const SizedBox(height: DesignTokens.spaceMD),
        ],
      ),
    );
  }
}
