import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app_strings.dart';
import 'language_service.dart';

/// Extension to easily access translations in any widget
extension LocalizationExtension on BuildContext {
  /// Get translated string for the given key
  String tr(String key) {
    // Try to get WidgetRef from context if available
    try {
      final container = ProviderScope.containerOf(this);
      final language = container.read(languageProvider);
      return AppStrings.getString(key, language);
    } catch (e) {
      // Fallback to English if provider is not available
      return AppStrings.getString(key, AppLanguage.english);
    }
  }
}

/// Mixin for StatefulWidget to easily access translations
mixin LocalizationMixin<T extends StatefulWidget> on State<T> {
  /// Get translated string for the given key
  String tr(String key) {
    return context.tr(key);
  }
}

/// Widget that rebuilds when language changes
class LocalizedText extends ConsumerWidget {
  final String textKey;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const LocalizedText(
    this.textKey, {
    super.key,
    this.style,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final language = ref.watch(languageProvider);
    final translatedText = AppStrings.getString(textKey, language);
    
    return Text(
      translatedText,
      style: style,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}

/// Consumer widget helper for easy translation access
class LocalizedWidget extends ConsumerWidget {
  final Widget Function(BuildContext context, String Function(String) tr) builder;

  const LocalizedWidget({
    super.key,
    required this.builder,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final language = ref.watch(languageProvider);
    
    String tr(String key) => AppStrings.getString(key, language);
    
    return builder(context, tr);
  }
}
