import 'app_strings_en.dart';
import 'app_strings_fr.dart';
import 'language_service.dart';

/// Main localization class that provides access to translations
class AppStrings {
  /// Get string based on current language
  static String getString(String key, AppLanguage language) {
    switch (language) {
      case AppLanguage.french:
        return _getFrenchString(key);
      case AppLanguage.english:
        return _getEnglishString(key);
    }
  }

  /// Get French string
  static String _getFrenchString(String key) {
    switch (key) {
      // Common words
      case 'yes': return AppStringsFr.yes;
      case 'no': return AppStringsFr.no;
      case 'ok': return AppStringsFr.ok;
      case 'cancel': return AppStringsFr.cancel;
      case 'save': return AppStringsFr.save;
      case 'delete': return AppStringsFr.delete;
      case 'edit': return AppStringsFr.edit;
      case 'search': return AppStringsFr.search;
      case 'loading': return AppStringsFr.loading;
      case 'error': return AppStringsFr.error;
      case 'success': return AppStringsFr.success;
      case 'warning': return AppStringsFr.warning;
      case 'info': return AppStringsFr.info;
      case 'retry': return AppStringsFr.retry;
      case 'back': return AppStringsFr.back;
      case 'next': return AppStringsFr.next;
      case 'previous': return AppStringsFr.previous;
      case 'finish': return AppStringsFr.finish;
      
      // App specific
      case 'appName': return AppStringsFr.appName;
      case 'appDescription': return AppStringsFr.appDescription;
      case 'welcome': return AppStringsFr.welcome;
      case 'getStarted': return AppStringsFr.getStarted;
      
      // Authentication
      case 'login': return AppStringsFr.login;
      case 'register': return AppStringsFr.register;
      case 'logout': return AppStringsFr.logout;
      case 'email': return AppStringsFr.email;
      case 'password': return AppStringsFr.password;
      case 'confirmPassword': return AppStringsFr.confirmPassword;
      case 'forgotPassword': return AppStringsFr.forgotPassword;
      case 'resetPassword': return AppStringsFr.resetPassword;
      case 'firstName': return AppStringsFr.firstName;
      case 'lastName': return AppStringsFr.lastName;
      case 'phoneNumber': return AppStringsFr.phoneNumber;
      case 'loginSuccess': return AppStringsFr.loginSuccess;
      case 'loginFailed': return AppStringsFr.loginFailed;
      case 'registerSuccess': return AppStringsFr.registerSuccess;
      case 'registerFailed': return AppStringsFr.registerFailed;
      
      // Home & Navigation
      case 'home': return AppStringsFr.home;
      case 'restaurants': return AppStringsFr.restaurants;
      case 'orders': return AppStringsFr.orders;
      case 'profile': return AppStringsFr.profile;
      case 'settings': return AppStringsFr.settings;
      case 'cart': return AppStringsFr.cart;
      case 'favorites': return AppStringsFr.favorites;
      case 'notifications': return AppStringsFr.notifications;
      
      // Restaurant & Food
      case 'restaurant': return AppStringsFr.restaurant;
      case 'menu': return AppStringsFr.menu;
      case 'addToCart': return AppStringsFr.addToCart;
      case 'orderNow': return AppStringsFr.orderNow;
      case 'deliveryTime': return AppStringsFr.deliveryTime;
      case 'deliveryFee': return AppStringsFr.deliveryFee;
      case 'rating': return AppStringsFr.rating;
      case 'reviews': return AppStringsFr.reviews;
      case 'cuisine': return AppStringsFr.cuisine;
      case 'popular': return AppStringsFr.popular;
      case 'recommended': return AppStringsFr.recommended;
      
      // Language
      case 'language': return AppStringsFr.language;
      case 'english': return AppStringsFr.english;
      case 'french': return AppStringsFr.french;
      case 'changeLanguage': return AppStringsFr.changeLanguage;
      case 'selectLanguage': return AppStringsFr.selectLanguage;
      case 'appRestartLanguage': return AppStringsFr.appRestartLanguage;
      
      default: return key; // Return key if no translation found
    }
  }

  /// Get English string
  static String _getEnglishString(String key) {
    switch (key) {
      // Common words
      case 'yes': return AppStringsEn.yes;
      case 'no': return AppStringsEn.no;
      case 'ok': return AppStringsEn.ok;
      case 'cancel': return AppStringsEn.cancel;
      case 'save': return AppStringsEn.save;
      case 'delete': return AppStringsEn.delete;
      case 'edit': return AppStringsEn.edit;
      case 'search': return AppStringsEn.search;
      case 'loading': return AppStringsEn.loading;
      case 'error': return AppStringsEn.error;
      case 'success': return AppStringsEn.success;
      case 'warning': return AppStringsEn.warning;
      case 'info': return AppStringsEn.info;
      case 'retry': return AppStringsEn.retry;
      case 'back': return AppStringsEn.back;
      case 'next': return AppStringsEn.next;
      case 'previous': return AppStringsEn.previous;
      case 'finish': return AppStringsEn.finish;
      
      // App specific
      case 'appName': return AppStringsEn.appName;
      case 'appDescription': return AppStringsEn.appDescription;
      case 'welcome': return AppStringsEn.welcome;
      case 'getStarted': return AppStringsEn.getStarted;
      
      // Authentication
      case 'login': return AppStringsEn.login;
      case 'register': return AppStringsEn.register;
      case 'logout': return AppStringsEn.logout;
      case 'email': return AppStringsEn.email;
      case 'password': return AppStringsEn.password;
      case 'confirmPassword': return AppStringsEn.confirmPassword;
      case 'forgotPassword': return AppStringsEn.forgotPassword;
      case 'resetPassword': return AppStringsEn.resetPassword;
      case 'firstName': return AppStringsEn.firstName;
      case 'lastName': return AppStringsEn.lastName;
      case 'phoneNumber': return AppStringsEn.phoneNumber;
      case 'loginSuccess': return AppStringsEn.loginSuccess;
      case 'loginFailed': return AppStringsEn.loginFailed;
      case 'registerSuccess': return AppStringsEn.registerSuccess;
      case 'registerFailed': return AppStringsEn.registerFailed;
      
      // Home & Navigation
      case 'home': return AppStringsEn.home;
      case 'restaurants': return AppStringsEn.restaurants;
      case 'orders': return AppStringsEn.orders;
      case 'profile': return AppStringsEn.profile;
      case 'settings': return AppStringsEn.settings;
      case 'cart': return AppStringsEn.cart;
      case 'favorites': return AppStringsEn.favorites;
      case 'notifications': return AppStringsEn.notifications;
      
      // Restaurant & Food
      case 'restaurant': return AppStringsEn.restaurant;
      case 'menu': return AppStringsEn.menu;
      case 'addToCart': return AppStringsEn.addToCart;
      case 'orderNow': return AppStringsEn.orderNow;
      case 'deliveryTime': return AppStringsEn.deliveryTime;
      case 'deliveryFee': return AppStringsEn.deliveryFee;
      case 'rating': return AppStringsEn.rating;
      case 'reviews': return AppStringsEn.reviews;
      case 'cuisine': return AppStringsEn.cuisine;
      case 'popular': return AppStringsEn.popular;
      case 'recommended': return AppStringsEn.recommended;
      
      // Language
      case 'language': return AppStringsEn.language;
      case 'english': return AppStringsEn.english;
      case 'french': return AppStringsEn.french;
      case 'changeLanguage': return AppStringsEn.changeLanguage;
      case 'selectLanguage': return AppStringsEn.selectLanguage;
      case 'appRestartLanguage': return AppStringsEn.appRestartLanguage;
      
      default: return key; // Return key if no translation found
    }
  }
}
