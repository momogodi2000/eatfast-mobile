import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eatfast_mobile/core/services/localization/language_service.dart';
import 'package:eatfast_mobile/core/services/localization/app_strings.dart';

void main() {
  group('Basic Language Tests', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    test('Language service initializes', () {
      final currentLanguage = container.read(languageProvider);
      expect(currentLanguage, isA<AppLanguage>());
    });

    test('Can get string with language parameter', () {
      final frenchString = AppStrings.getString('yes', AppLanguage.french);
      final englishString = AppStrings.getString('yes', AppLanguage.english);
      
      expect(frenchString, isNotEmpty);
      expect(englishString, isNotEmpty);
    });

    test('AppLanguage enum works', () {
      expect(AppLanguage.values, hasLength(2));
      expect(AppLanguage.values, contains(AppLanguage.french));
      expect(AppLanguage.values, contains(AppLanguage.english));
    });
  });
}
