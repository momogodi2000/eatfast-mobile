// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Eat Fast';

  @override
  String get welcome => 'Bienvenue';

  @override
  String get error_generic => 'Une erreur s\'est produite';

  @override
  String get retry => 'Réessayer';

  @override
  String get loading => 'Chargement...';

  @override
  String get login => 'Connexion';

  @override
  String get register => 'S\'inscrire';

  @override
  String get email => 'Email';

  @override
  String get password => 'Mot de passe';

  @override
  String get forgotPassword => 'Mot de passe oublié';

  @override
  String get home => 'Accueil';

  @override
  String get restaurants => 'Restaurants';

  @override
  String get orders => 'Commandes';

  @override
  String get profile => 'Profil';
}
