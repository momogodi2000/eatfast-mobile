// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Eat Fast';

  @override
  String get welcome => 'Welcome';

  @override
  String get error_generic => 'Something went wrong';

  @override
  String get retry => 'Retry';

  @override
  String get loading => 'Loading...';

  @override
  String get login => 'Login';

  @override
  String get register => 'Register';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get forgotPassword => 'Forgot Password';

  @override
  String get home => 'Home';

  @override
  String get restaurants => 'Restaurants';

  @override
  String get orders => 'Orders';

  @override
  String get profile => 'Profile';
}
