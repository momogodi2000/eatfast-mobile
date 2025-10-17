import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eatfast_mobile/shared/l10n/language_provider.dart';
import 'package:eatfast_mobile/shared/l10n/arb/app_localizations.dart';
import 'package:eatfast_mobile/shared/themes/design_tokens.dart';

/// Language settings screen for changing app language
class LanguageSettingsScreen extends ConsumerWidget {
  const LanguageSettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLanguage = ref.watch(languageProvider);
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.language),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(DesignTokens.spaceLG),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Text(
                l10n.changeLanguage,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: DesignTokens.fontWeightBold,
                  color: DesignTokens.textPrimary,
                ),
              ),

              const SizedBox(height: DesignTokens.spaceMD),

              Text(
                l10n.selectLanguage,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: DesignTokens.textSecondary,
                ),
              ),

              const SizedBox(height: DesignTokens.spaceXL),

              // Language Options
              _buildLanguageOption(
                context: context,
                ref: ref,
                language: const Locale('fr', ''),
                title: 'Fran�ais',
                subtitle: 'French',
                isSelected: currentLanguage.languageCode == 'fr',
              ),

              const SizedBox(height: DesignTokens.spaceMD),

              _buildLanguageOption(
                context: context,
                ref: ref,
                language: const Locale('en', ''),
                title: 'English',
                subtitle: 'English',
                isSelected: currentLanguage.languageCode == 'en',
              ),

              const Spacer(),

              // Note
              Container(
                padding: const EdgeInsets.all(DesignTokens.spaceMD),
                decoration: BoxDecoration(
                  color: DesignTokens.infoColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
                  border: Border.all(
                    color: DesignTokens.infoColor.withValues(alpha: 0.3),
                  ),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.info_outline,
                      color: DesignTokens.infoColor,
                      size: DesignTokens.iconSM,
                    ),
                    const SizedBox(width: DesignTokens.spaceXS),
                    Expanded(
                      child: Text(
                        l10n.appRestartLanguage,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: DesignTokens.infoColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageOption({
    required BuildContext context,
    required WidgetRef ref,
    required Locale language,
    required String title,
    required String subtitle,
    required bool isSelected,
  }) {
    return Card(
      elevation: isSelected ? 4 : 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
        side: BorderSide(
          color: isSelected
              ? DesignTokens.primaryColor
              : DesignTokens.borderColor,
          width: isSelected ? 2 : 1,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
        onTap: () async {
          if (!isSelected) {
            await ref.read(languageProvider.notifier).changeLanguage(language);

            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Language changed to ${language.languageCode == 'fr' ? 'Fran�ais' : 'English'}',
                  ),
                  backgroundColor: DesignTokens.successColor,
                ),
              );
            }
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(DesignTokens.spaceMD),
          child: Row(
            children: [
              // Language flag/icon
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: isSelected
                      ? DesignTokens.primaryColor.withValues(alpha: 0.1)
                      : DesignTokens.backgroundSecondary,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  language.languageCode == 'fr'
                      ? Icons.language
                      : Icons.translate,
                  color: isSelected
                      ? DesignTokens.primaryColor
                      : DesignTokens.textSecondary,
                ),
              ),

              const SizedBox(width: DesignTokens.spaceMD),

              // Language info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: DesignTokens.fontWeightMedium,
                        color: isSelected
                            ? DesignTokens.primaryColor
                            : DesignTokens.textPrimary,
                      ),
                    ),
                    const SizedBox(height: DesignTokens.spaceXXS),
                    Text(
                      subtitle,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: DesignTokens.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),

              // Selection indicator
              if (isSelected)
                const Icon(
                  Icons.check_circle,
                  color: DesignTokens.primaryColor,
                  size: DesignTokens.iconMD,
                )
              else
                const Icon(
                  Icons.radio_button_unchecked,
                  color: DesignTokens.textTertiary,
                  size: DesignTokens.iconMD,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
