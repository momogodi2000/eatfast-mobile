import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'app_localizations_en.dart';
import 'app_localizations_fr.dart';

/// Class for app localizations
abstract class AppLocalizations {
  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static const List<Locale> supportedLocales = [
    Locale('en', ''),
    Locale('fr', ''),
  ];

  /// App name and branding
  String get appName;
  String get appTagline;
  String get welcomeMessage;
  String get getStarted;

  /// Authentication
  String get login;
  String get register;
  String get forgotPassword;
  String get email;
  String get password;
  String get confirmPassword;
  String get fullName;
  String get phoneNumber;
  String get rememberMe;
  String get loginSuccess;
  String get registrationSuccess;
  String get loginButton;
  String get registerButton;
  String get alreadyHaveAccount;
  String get dontHaveAccount;
  String get createAccount;
  String get backToLogin;

  /// Home Screen
  String get home;
  String get searchRestaurants;
  String get popularRestaurants;
  String get nearbyRestaurants;
  String get featuredDishes;
  String get viewAll;
  String get orderNow;

  /// Restaurant & Food
  String get restaurants;
  String get menu;
  String get addToCart;
  String get viewMenu;
  String get rating;
  String get deliveryTime;
  String get deliveryFee;
  String get minimumOrder;
  String get openNow;
  String get closed;

  /// Cart & Orders
  String get cart;
  String get checkout;
  String get placeOrder;
  String get orderTotal;
  String get subtotal;
  String get tax;
  String get total;
  String get orderPlaced;
  String get orderTracking;
  String get orderHistory;

  /// Profile
  String get profile;
  String get editProfile;
  String get personalInfo;
  String get addresses;
  String get paymentMethods;
  String get notifications;
  String get settings;
  String get logout;
  String get deleteAccount;

  /// Address Management
  String get addAddress;
  String get editAddress;
  String get deleteAddress;
  String get selectAddress;
  String get currentLocation;
  String get savedAddresses;
  String get work;
  String get other;

  /// Payment
  String get paymentMethod;
  String get addPaymentMethod;
  String get mobileMoney;
  String get mtnMobileMoney;
  String get orangeMoney;
  String get euMobile;
  String get cashOnDelivery;

  /// Common UI Elements
  String get save;
  String get cancel;
  String get delete;
  String get edit;
  String get confirm;
  String get yes;
  String get no;
  String get ok;
  String get loading;
  String get retry;
  String get close;
  String get next;
  String get previous;
  String get skip;
  String get finish;

  /// Error Messages
  String get errorNetwork;
  String get errorServer;
  String get errorUnknown;
  String get errorInvalidEmail;
  String get errorInvalidPassword;
  String get errorPasswordMismatch;
  String get errorRequiredField;

  /// Success Messages
  String get successSaved;
  String get successDeleted;
  String get successUpdated;

  /// Company Information
  String get aboutUs;
  String get ourTeam;
  String get contactUs;
  String get privacyPolicy;
  String get termsOfService;

  /// Language Settings
  String get language;
  String get english;
  String get french;
  String get changeLanguage;
  String get selectLanguage;
  String get appRestartLanguage;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'fr'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    switch (locale.languageCode) {
      case 'fr':
        return SynchronousFuture<AppLocalizations>(AppLocalizationsFr());
      case 'en':
      default:
        return SynchronousFuture<AppLocalizations>(AppLocalizationsEn());
    }
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}