/// App Constants for EatFast application
class AppConstants {
  AppConstants._();
  
  // App Information
  static const String appName = 'EatFast';
  static const String appTagline = 'Délicieux à votre porte';
  static const String appVersion = '1.0.0';
  
  // Company Information
  static const String companyName = 'EatFast Cameroon';
  static const String companyEmail = 'contact@eatfast.cm';
  static const String companyPhone = '+237 6XX XXX XXX';
  static const String companyWhatsApp = '+237 6XX XXX XXX';
  static const String companyAddress = 'Yaoundé, Cameroun';
  
  // API Configuration (matching backend)
  static const String baseUrl = 'https://eat-fast-backend-express-js.onrender.com'; // Production URL
  static const String apiVersion = 'v1';
  static const int connectionTimeout = 60000; // Increased for Render's cold start
  static const int receiveTimeout = 60000;
  
  // Development URL (use this for local development)
  // static const String baseUrl = 'http://localhost:3000';
  
  // Storage Keys
  static const String keyIsFirstTime = 'is_first_time';
  static const String keyUserToken = 'user_token';
  static const String keyUserData = 'user_data';
  static const String keySelectedLanguage = 'selected_language';
  static const String keyThemeMode = 'theme_mode';
  static const String keyNotificationEnabled = 'notification_enabled';
  
  // Animation Durations
  static const int splashDuration = 3000; // 3 seconds
  static const int pageTransitionDuration = 300;
  static const int buttonAnimationDuration = 150;
  
  // UI Constants
  static const double defaultPadding = 16.0;
  static const double defaultMargin = 8.0;
  static const double defaultBorderRadius = 12.0;
  static const double cardElevation = 2.0;
  
  // Text Constants
  static const String welcomeMessage = 'Bienvenue chez EatFast';
  static const String missionMessage = 'Notre Mission';
  static const String deliveryMessage = 'Livraison Rapide';
  static const String getStartedButton = 'Commencer';
  static const String skipButton = 'Passer';
  static const String nextButton = 'Suivant';
  static const String previousButton = 'Précédent';
  static const String acceptTermsButton = 'J\'accepte les conditions';
  static const String continueButton = 'Continuer';
  
  // Error Messages
  static const String networkError = 'Erreur de connexion. Vérifiez votre connexion internet.';
  static const String serverError = 'Erreur serveur. Veuillez réessayer plus tard.';
  static const String unknownError = 'Une erreur inconnue s\'est produite.';
  static const String validationError = 'Veuillez vérifier les informations saisies.';
  
  // Success Messages
  static const String loginSuccess = 'Connexion réussie!';
  static const String registrationSuccess = 'Inscription réussie!';
  static const String profileUpdateSuccess = 'Profil mis à jour avec succès!';
  
  // Validation Constants
  static const int minPasswordLength = 6;
  static const int maxNameLength = 50;
  static const int maxEmailLength = 100;
  static const int maxPhoneLength = 15;
  
  // Image Assets
  static const String logoAsset = 'assets/logo/eat-fast-logo.png';
  static const String splashBackground = 'assets/images/splash_background.png';
  static const String onboardingWelcome = 'assets/images/welcome_food.png';
  static const String onboardingMission = 'assets/images/mission.png';
  static const String onboardingDelivery = 'assets/images/delivery.png';
  
  // Animation Assets
  static const String logoAnimation = 'assets/animations/app_logo_animation.json';
  static const String loadingAnimation = 'assets/animations/loading_spinner.json';
  static const String welcomeAnimation = 'assets/animations/welcome_food.json';
  static const String missionAnimation = 'assets/animations/mission.json';
  static const String deliveryAnimation = 'assets/animations/delivery.json';
  
  // Social Media Links
  static const String facebookUrl = 'https://facebook.com/eatfastcameroon';
  static const String instagramUrl = 'https://instagram.com/eatfastcameroon';
  static const String twitterUrl = 'https://twitter.com/eatfastcameroon';
  static const String linkedinUrl = 'https://linkedin.com/company/eatfastcameroon';
  
  // Terms and Conditions
  static const String termsTitle = 'Conditions Générales d\'Utilisation';
  static const String privacyPolicyTitle = 'Politique de Confidentialité';
  
  // Menu Categories
  static const List<String> foodCategories = [
    'Plats Traditionnels',
    'Fast Food',
    'Boissons',
    'Desserts',
    'Fruits',
    'Petit Déjeuner',
    'Déjeuner',
    'Dîner',
  ];
  
  // Popular Cameroon Dishes (from assets)
  static const Map<String, String> popularDishes = {
    'Ndolé': 'assets/images/ndoles.jpeg',
    'DG (Porc aux Plantains)': 'assets/images/DG.jpeg',
    'Mbongo Tchobi': 'assets/images/mbongo.jpeg',
    'Eru': 'assets/images/eru.jpeg',
    'Koki': 'assets/images/koki.jpeg',
    'Poulet Braisé': 'assets/images/braise.jpg',
    'Bobolo': 'assets/images/bobolo.jpg',
    'TKC': 'assets/images/TKC.jpg',
  };
  
  // Delivery Settings
  static const double minimumOrderAmount = 2000.0; // FCFA
  static const double deliveryFee = 500.0; // FCFA
  static const int estimatedDeliveryTime = 30; // minutes
  
  // Payment Methods
  static const List<String> paymentMethods = [
    'Mobile Money MTN',
    'Mobile Money Orange',
    'EU Mobile',
    'Espèces à la livraison',
  ];
}

