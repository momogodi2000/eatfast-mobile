/// Enhanced Localization Service for EatFast
/// Comprehensive multi-language support with dynamic content and RTL support
library;

import 'dart:convert';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constants/api_constants.dart';
import '../api/api_client.dart';

enum SupportedLocale {
  french('fr', 'FR', 'Français', '🇫🇷'),
  english('en', 'US', 'English', '🇺🇸'),
  arabic('ar', 'SA', 'العربية', '🇸🇦'),
  spanish('es', 'ES', 'Español', '🇪🇸');

  const SupportedLocale(this.languageCode, this.countryCode, this.displayName, this.flag);

  final String languageCode;
  final String countryCode;
  final String displayName;
  final String flag;

  Locale get locale => Locale(languageCode, countryCode);

  String get fullCode => '${languageCode}_$countryCode';

  bool get isRTL => languageCode == 'ar';
}

class EnhancedLocalizationService {
  static final EnhancedLocalizationService _instance = EnhancedLocalizationService._internal();
  factory EnhancedLocalizationService() => _instance;

  final ApiClient _apiClient = ApiClient();
  SharedPreferences? _prefs;

  // Current locale and translations
  SupportedLocale _currentLocale = SupportedLocale.french; // Default to French for Cameroon
  Map<String, String> _localizedStrings = {};
  Map<String, Map<String, String>> _dynamicContent = {};

  // Getters
  SupportedLocale get currentLocale => _currentLocale;
  Locale get locale => _currentLocale.locale;
  bool get isRTL => _currentLocale.isRTL;
  List<SupportedLocale> get supportedLocales => SupportedLocale.values;

  EnhancedLocalizationService._internal();

  /// Initialize localization service
  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
    await _loadSavedLocale();
    await _loadLocalTranslations();
    await _loadDynamicContent();
  }

  /// Load saved locale from preferences
  Future<void> _loadSavedLocale() async {
    final savedLocaleCode = _prefs?.getString('selected_locale');
    if (savedLocaleCode != null) {
      try {
        _currentLocale = SupportedLocale.values.firstWhere(
          (locale) => locale.fullCode == savedLocaleCode,
        );
      } catch (e) {
        // If saved locale is not found, detect from system
        await _detectSystemLocale();
      }
    } else {
      await _detectSystemLocale();
    }
  }

  /// Detect locale from system settings
  Future<void> _detectSystemLocale() async {
    final systemLocale = PlatformDispatcher.instance.locale;

    try {
      _currentLocale = SupportedLocale.values.firstWhere(
        (locale) => locale.languageCode == systemLocale.languageCode,
      );
    } catch (e) {
      // Default to French for Cameroon market
      _currentLocale = SupportedLocale.french;
    }

    await _saveLocale(_currentLocale);
  }

  /// Change current locale
  Future<void> changeLocale(SupportedLocale newLocale) async {
    if (_currentLocale == newLocale) return;

    _currentLocale = newLocale;
    await _saveLocale(newLocale);
    await _loadLocalTranslations();
    await _loadDynamicContent();

    // Update backend user preferences
    await _updateBackendLanguagePreference();

    if (kDebugMode) print('Locale changed to: ${newLocale.fullCode}');
  }

  /// Save locale to preferences
  Future<void> _saveLocale(SupportedLocale locale) async {
    await _prefs?.setString('selected_locale', locale.fullCode);
  }

  /// Load static translations from assets
  Future<void> _loadLocalTranslations() async {
    try {
      final String jsonString = await rootBundle.loadString(
        'assets/i18n/${_currentLocale.languageCode}.json',
      );
      final Map<String, dynamic> jsonMap = json.decode(jsonString);

      _localizedStrings = jsonMap.map((key, value) => MapEntry(key, value.toString()));

      if (kDebugMode) print('Loaded ${_localizedStrings.length} translations for ${_currentLocale.languageCode}');
    } catch (e) {
      if (kDebugMode) print('Error loading translations: $e');
      _localizedStrings = {};
    }
  }

  /// Load dynamic content from backend
  Future<void> _loadDynamicContent() async {
    try {
      final response = await _apiClient.get(
        '${ApiConstants.baseUrl}/localization/dynamic',
        queryParameters: {
          'locale': _currentLocale.languageCode,
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data ?? {};
        _dynamicContent = data.map((key, value) => MapEntry(
          key,
          Map<String, String>.from(value as Map),
        ));

        if (kDebugMode) print('Loaded dynamic content for ${_currentLocale.languageCode}');
      }
    } catch (e) {
      if (kDebugMode) print('Error loading dynamic content: $e');
      _dynamicContent = {};
    }
  }

  /// Update language preference on backend
  Future<void> _updateBackendLanguagePreference() async {
    try {
      await _apiClient.put(
        '${ApiConstants.baseUrl}/user/language-preference',
        data: {
          'language': _currentLocale.languageCode,
          'locale': _currentLocale.fullCode,
        },
      );
    } catch (e) {
      if (kDebugMode) print('Error updating backend language preference: $e');
    }
  }

  /// Get localized string
  String getString(String key, {Map<String, String>? params}) {
    String value = _localizedStrings[key] ?? key;

    // Replace parameters if provided
    if (params != null) {
      params.forEach((paramKey, paramValue) {
        value = value.replaceAll('{$paramKey}', paramValue);
      });
    }

    return value;
  }

  /// Get dynamic content
  String getDynamicContent(String category, String key, {String? fallback}) {
    return _dynamicContent[category]?[key] ?? fallback ?? key;
  }

  /// Get pluralized string
  String getPlural(String key, int count, {Map<String, String>? params}) {
    String pluralKey;

    if (count == 0) {
      pluralKey = '${key}_zero';
    } else if (count == 1) {
      pluralKey = '${key}_one';
    } else {
      pluralKey = '${key}_other';
    }

    // Fallback to base key if plural not found
    String value = _localizedStrings[pluralKey] ?? _localizedStrings[key] ?? key;

    // Replace count parameter
    value = value.replaceAll('{count}', count.toString());

    // Replace other parameters if provided
    if (params != null) {
      params.forEach((paramKey, paramValue) {
        value = value.replaceAll('{$paramKey}', paramValue);
      });
    }

    return value;
  }

  /// Format currency for current locale
  String formatCurrency(double amount, {String? currencyCode}) {
    // For Cameroon market, default to FCFA
    currencyCode ??= 'XAF';

    switch (_currentLocale.languageCode) {
      case 'fr':
        return '${amount.toStringAsFixed(0)} FCFA';
      case 'en':
        return 'FCFA ${amount.toStringAsFixed(0)}';
      case 'ar':
        return '${amount.toStringAsFixed(0)} فرنك';
      default:
        return '${amount.toStringAsFixed(0)} FCFA';
    }
  }

  /// Format date for current locale
  String formatDate(DateTime date, {DateFormat format = DateFormat.full}) {
    switch (_currentLocale.languageCode) {
      case 'fr':
        return _formatDateFrench(date, format);
      case 'en':
        return _formatDateEnglish(date, format);
      case 'ar':
        return _formatDateArabic(date, format);
      default:
        return _formatDateFrench(date, format);
    }
  }

  /// Format time for current locale
  String formatTime(DateTime time) {
    final hour = time.hour;
    final minute = time.minute.toString().padLeft(2, '0');

    switch (_currentLocale.languageCode) {
      case 'fr':
        return '${hour}h$minute';
      case 'en':
        final period = hour >= 12 ? 'PM' : 'AM';
        final displayHour = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);
        return '$displayHour:$minute $period';
      case 'ar':
        return '$hour:$minute';
      default:
        return '${hour}h$minute';
    }
  }

  /// Get localized day name
  String getDayName(int weekday) {
    final key = 'day_$weekday';
    return getString(key);
  }

  /// Get localized month name
  String getMonthName(int month) {
    final key = 'month_$month';
    return getString(key);
  }

  /// Get restaurant category name
  String getRestaurantCategory(String category) {
    return getDynamicContent('restaurant_categories', category, fallback: category);
  }

  /// Get food category name
  String getFoodCategory(String category) {
    return getDynamicContent('food_categories', category, fallback: category);
  }

  /// Get order status name
  String getOrderStatus(String status) {
    return getDynamicContent('order_statuses', status, fallback: status);
  }

  /// Get error message
  String getErrorMessage(String errorCode) {
    final key = 'error_$errorCode';
    return getString(key);
  }

  /// Get validation message
  String getValidationMessage(String field, String rule, {Map<String, String>? params}) {
    final key = 'validation_${field}_$rule';
    return getString(key, params: params);
  }

  /// Check if string is localized
  bool isLocalized(String key) {
    return _localizedStrings.containsKey(key);
  }

  /// Get locale-specific text direction
  TextDirection get textDirection => isRTL ? TextDirection.rtl : TextDirection.ltr;

  /// Get locale-specific alignment
  TextAlign get defaultTextAlign => isRTL ? TextAlign.right : TextAlign.left;

  /// Get locale-specific edge insets (for RTL support)
  EdgeInsetsGeometry getLocalizedPadding({
    double? left,
    double? right,
    double? top,
    double? bottom,
  }) {
    if (isRTL) {
      // Swap left and right for RTL
      return EdgeInsets.only(
        left: right ?? 0,
        right: left ?? 0,
        top: top ?? 0,
        bottom: bottom ?? 0,
      ) as EdgeInsetsGeometry;
    } else {
      return EdgeInsets.only(
        left: left ?? 0,
        right: right ?? 0,
        top: top ?? 0,
        bottom: bottom ?? 0,
      ) as EdgeInsetsGeometry;
    }
  }

  /// Download latest translations from backend
  Future<bool> updateTranslations() async {
    try {
      final response = await _apiClient.get(
        '${ApiConstants.baseUrl}/localization/translations',
        queryParameters: {
          'locale': _currentLocale.languageCode,
          'version': 'latest',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> newTranslations = response.data ?? {};
        _localizedStrings = newTranslations.map((key, value) => MapEntry(key, value.toString()));

        // Cache updated translations locally
        await _cacheTranslations(newTranslations);

        return true;
      }
      return false;
    } catch (e) {
      if (kDebugMode) print('Error updating translations: $e');
      return false;
    }
  }

  /// Cache translations locally
  Future<void> _cacheTranslations(Map<String, dynamic> translations) async {
    final jsonString = json.encode(translations);
    await _prefs?.setString('cached_translations_${_currentLocale.languageCode}', jsonString);
  }

  /// Private helper methods for date formatting
  String _formatDateFrench(DateTime date, DateFormat format) {
    switch (format) {
      case DateFormat.full:
        return '${getDayName(date.weekday)} ${date.day} ${getMonthName(date.month)} ${date.year}';
      case DateFormat.long:
        return '${date.day} ${getMonthName(date.month)} ${date.year}';
      case DateFormat.medium:
        return '${date.day}/${date.month}/${date.year}';
      case DateFormat.short:
        return '${date.day}/${date.month}';
    }
  }

  String _formatDateEnglish(DateTime date, DateFormat format) {
    switch (format) {
      case DateFormat.full:
        return '${getDayName(date.weekday)}, ${getMonthName(date.month)} ${date.day}, ${date.year}';
      case DateFormat.long:
        return '${getMonthName(date.month)} ${date.day}, ${date.year}';
      case DateFormat.medium:
        return '${date.month}/${date.day}/${date.year}';
      case DateFormat.short:
        return '${date.month}/${date.day}';
    }
  }

  String _formatDateArabic(DateTime date, DateFormat format) {
    switch (format) {
      case DateFormat.full:
        return '${getDayName(date.weekday)}، ${date.day} ${getMonthName(date.month)} ${date.year}';
      case DateFormat.long:
        return '${date.day} ${getMonthName(date.month)} ${date.year}';
      case DateFormat.medium:
        return '${date.day}/${date.month}/${date.year}';
      case DateFormat.short:
        return '${date.day}/${date.month}';
    }
  }
}

/// Date format options
enum DateFormat {
  full,    // Friday, January 15, 2024
  long,    // January 15, 2024
  medium,  // 01/15/2024
  short,   // 01/15
}

/// Edge insets for localization
class EdgeInsets {
  final double left;
  final double right;
  final double top;
  final double bottom;

  const EdgeInsets.only({
    required this.left,
    required this.right,
    required this.top,
    required this.bottom,
  });
}

/// Edge insets geometry interface
abstract class EdgeInsetsGeometry {
  const EdgeInsetsGeometry();
}