import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eatfast_mobile/core/services/localization/language_service.dart';
import 'package:eatfast_mobile/core/services/localization/app_strings.dart';

void main() {
  group('Language Service Tests', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    test('Language service initializes with default language', () {
      final languageNotifier = container.read(languageProvider.notifier);
      final currentLanguage = container.read(languageProvider);
      
      expect(currentLanguage, isA<AppLanguage>());
      expect(languageNotifier, isA<LanguageNotifier>());
    });

    test('Can change language to French', () async {
      final languageNotifier = container.read(languageProvider.notifier);
      
      await languageNotifier.changeLanguage(AppLanguage.french);
      final currentLanguage = container.read(languageProvider);
      
      expect(currentLanguage, equals(AppLanguage.french));
    });

    test('Can change language to English', () async {
      final languageNotifier = container.read(languageProvider.notifier);
      
      await languageNotifier.changeLanguage(AppLanguage.english);
      final currentLanguage = container.read(languageProvider);
      
      expect(currentLanguage, equals(AppLanguage.english));
    });

    test('Language changes persist', () async {
      final languageNotifier = container.read(languageProvider.notifier);
      
      // Change to French
      await languageNotifier.changeLanguage(AppLanguage.french);
      expect(container.read(languageProvider), equals(AppLanguage.french));
      
      // Change to English
      await languageNotifier.changeLanguage(AppLanguage.english);
      expect(container.read(languageProvider), equals(AppLanguage.english));
    });
  });

  group('App Strings Tests', () {
    test('French strings are properly defined', () {
      const testStrings = [
        'yes',
        'no',
        'ok',
        'cancel',
        'save',
        'delete',
        'loading',
        'home',
        'profile',
        'settings',
        'login',
        'logout',
      ];

      for (final key in testStrings) {
        final translation = AppStrings.getString(key, AppLanguage.french);
        expect(translation, isNotEmpty);
        expect(translation, isNot(equals(key))); // Should be translated, not just return the key
      }
    });

    test('English strings are properly defined', () {
      const testStrings = [
        'yes',
        'no',
        'ok',
        'cancel',
        'save',
        'delete',
        'loading',
        'home',
        'profile',
        'settings',
        'login',
        'logout',
      ];

      for (final key in testStrings) {
        final translation = AppStrings.getString(key, AppLanguage.english);
        expect(translation, isNotEmpty);
        expect(translation, isNot(equals(key))); // Should be translated, not just return the key
      }
    });

    test('Translation keys have both French and English versions', () {
      const testKeys = [
        'appName',
        'welcome',
        'getStarted',
        'email',
        'password',
        'french',
        'english',
        'changeLanguage',
      ];

      for (final key in testKeys) {
        final frenchTranslation = AppStrings.getString(key, AppLanguage.french);
        final englishTranslation = AppStrings.getString(key, AppLanguage.english);
        
        expect(frenchTranslation, isNotEmpty, reason: 'French translation for "$key" should not be empty');
        expect(englishTranslation, isNotEmpty, reason: 'English translation for "$key" should not be empty');
        expect(frenchTranslation, isNot(equals(englishTranslation)), 
               reason: 'French and English translations for "$key" should be different');
      }
    });

    test('Unknown keys return the key itself', () {
      const unknownKey = 'nonexistent_key_12345';
      
      final frenchResult = AppStrings.getString(unknownKey, AppLanguage.french);
      final englishResult = AppStrings.getString(unknownKey, AppLanguage.english);
      
      expect(frenchResult, equals(unknownKey));
      expect(englishResult, equals(unknownKey));
    });

    test('Language specific strings are different', () {
      const testKeys = [
        'yes',
        'no',
        'save',
        'cancel',
        'french',
        'english',
      ];

      for (final key in testKeys) {
        final frenchTranslation = AppStrings.getString(key, AppLanguage.french);
        final englishTranslation = AppStrings.getString(key, AppLanguage.english);
        
        // Languages should provide different translations (except for some universal words)
        if (key != 'ok' && key != 'email') {
          expect(frenchTranslation, isNot(equals(englishTranslation)), 
                 reason: 'Translation for "$key" should be different in French and English');
        }
      }
    });
  });

  group('AppLanguage Enum Tests', () {
    test('AppLanguage enum has correct values', () {
      expect(AppLanguage.values, hasLength(2));
      expect(AppLanguage.values, contains(AppLanguage.french));
      expect(AppLanguage.values, contains(AppLanguage.english));
    });

    test('AppLanguage toString returns expected values', () {
      expect(AppLanguage.french.toString(), contains('french'));
      expect(AppLanguage.english.toString(), contains('english'));
    });
  });
}
