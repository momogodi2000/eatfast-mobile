/// Application-wide constants
class AppConstants {
  AppConstants._();

  // App Information
  static const String appName = 'EatFast';
  static const String appVersion = '1.0.0';
  static const String appDescription = 'Fast food delivery made simple';
  static const String appTagline = 'Fast food delivery made simple';

  // Assets
  static const String logoAsset = 'assets/logo/eat-fast-logo.png';

  // Splash Screen
  static const int splashDuration = 2500;

  // Company Information
  static const String companyPhone = '+237 6XX XXX XXX';
  static const String companyEmail = 'contact@eatfast.cm';
  static const String companyWhatsApp = '+237 6XX XXX XXX';
  static const String companyAddress = 'Yaoundé, Cameroon';

  // Social Media URLs
  static const String facebookUrl = 'https://facebook.com/eatfastcm';
  static const String instagramUrl = 'https://instagram.com/eatfastcm';
  static const String twitterUrl = 'https://twitter.com/eatfastcm';
  static const String linkedinUrl = 'https://linkedin.com/company/eatfastcm';

  // API Configuration
  static const String baseUrl = 'https://api.eatfast.com';
  static const Duration apiTimeout = Duration(seconds: 30);

  // Driver endpoints
  static const String driverProfile = '/driver/profile';
  static const String driverEarnings = '/driver/earnings';
  static const String availableOrders = '/driver/orders/available';
  static const String activeDelivery = '/driver/delivery/active';

  // Pagination
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;

  // Validation
  static const int minPasswordLength = 8;
  static const int maxNameLength = 50;
  static const int maxDescriptionLength = 500;

  // File Upload
  static const int maxImageSizeBytes = 5 * 1024 * 1024; // 5MB
  static const List<String> allowedImageTypes = ['jpg', 'jpeg', 'png', 'webp'];

  // Payment
  static const double minTopUpAmount = 1.0;
  static const double maxTopUpAmount = 1000.0;
  static const int paymentTimeoutMinutes = 15;

  // Orders
  static const Duration orderPreparationTime = Duration(minutes: 15);
  static const Duration deliveryTime = Duration(minutes: 30);
  static const int maxOrderItems = 50;
  static const double minimumOrderAmount = 5000.0; // 5000 FCFA

  // Loyalty
  static const int pointsPerDollar = 1;
  static const int minPointsForRedemption = 100;

  // Cache
  static const Duration cacheTimeout = Duration(hours: 1);
  static const int maxCacheSize = 100;

  // Shared Preferences Keys
  static const String keyIsFirstTime = 'is_first_time';

  // UI
  static const double defaultBorderRadius = 8.0;
  static const double defaultElevation = 2.0;

  // Food Categories
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

  // Onboarding Text
  static const String onboardingWelcome = 'Bienvenue sur EatFast';
  static const String onboardingMission = 'Notre Mission';
  static const String onboardingDelivery = 'Livraison Rapide';
  static const String welcomeAnimation = 'assets/animations/welcome.json';
  static const String missionAnimation = 'assets/animations/mission.json';
  static const String deliveryAnimation = 'assets/animations/delivery.json';

  // Button Text
  static const String skipButton = 'Passer';
  static const String previousButton = 'Précédent';
  static const String nextButton = 'Suivant';
  static const String getStartedButton = 'Commencer';
  static const String continueButton = 'Continuer';

  // Terms & Legal
  static const String termsTitle = 'Conditions Générales';
  static const String companyName = 'EatFast';
  static const int estimatedDeliveryTime = 30; // minutes

  // Delivery
  static const double deliveryFee = 1500.0; // FCFA
}
