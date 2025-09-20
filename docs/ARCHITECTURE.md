# EatFast Mobile App - Architecture Documentation

## 🏗️ System Architecture Overview

EatFast follows a **Clean Architecture** pattern with **Feature-First** organization, implementing modern Flutter development practices with **Riverpod** for state management and **Go Router** for navigation.

## 📁 Project Structure

```
lib/
├── core/                      # Core business logic and shared utilities
│   ├── auth/                  # Authentication system
│   │   ├── models/            # User models (AppUser)
│   │   ├── providers/         # Auth state management
│   │   └── services/          # Auth business logic
│   ├── constants/             # App-wide constants
│   │   ├── api_constants.dart # API endpoints
│   │   └── app_constants.dart # General constants
│   ├── models/                # Core domain models
│   │   ├── restaurant.dart    # Restaurant entity
│   │   ├── order.dart         # Order entity
│   │   └── payment.dart       # Payment entity
│   ├── router/                # Navigation configuration
│   │   ├── app_router.dart    # Go Router setup
│   │   ├── route_guard.dart   # Route protection
│   │   └── route_names.dart   # Named routes
│   ├── services/              # Core services
│   │   ├── api/               # HTTP client
│   │   ├── auth/              # Authentication service
│   │   ├── restaurant/        # Restaurant service
│   │   └── storage/           # Local storage
│   └── theme/                 # App theming
│       ├── design_tokens.dart # Design system
│       └── app_theme.dart     # Material theme
├── features/                  # Feature modules
│   ├── auth/                  # Authentication feature
│   │   ├── data/              # Data layer
│   │   ├── domain/            # Business logic
│   │   ├── presentation/      # UI layer
│   │   └── providers/         # State management
│   ├── restaurants/           # Restaurant feature
│   ├── orders/                # Order management
│   ├── payments/              # Payment processing
│   ├── profile/               # User profile
│   ├── wallet/                # Digital wallet
│   ├── loyalty/               # Loyalty program
│   └── settings/              # App settings
├── shared/                    # Shared UI components
│   ├── widgets/               # Reusable widgets
│   └── utils/                 # Utility functions
└── main.dart                  # App entry point
```

## 🏛️ Architectural Layers

### 1. Presentation Layer
- **Widgets**: UI components and screens
- **State Management**: Riverpod providers and notifiers
- **Navigation**: Go Router with route guards
- **Theming**: Material Design with custom design tokens

### 2. Domain Layer
- **Models**: Business entities and data classes
- **Use Cases**: Business logic and rules
- **Repositories**: Abstract data access interfaces
- **Services**: Business logic services

### 3. Data Layer
- **API Client**: HTTP communication with backend
- **Local Storage**: Hive/SharedPreferences for offline data
- **Repository Implementations**: Concrete data access
- **Data Sources**: Remote and local data sources

## 🔄 State Management Architecture

### Riverpod Provider Pattern

```dart
// Example: Restaurant List Provider
final restaurantListProvider = StateNotifierProvider.family<
  RestaurantListNotifier,
  RestaurantListState,
  RestaurantFilter?
>((ref, filter) {
  return RestaurantListNotifier(
    ref.watch(restaurantServiceProvider),
    filter
  );
});

// State Classes
sealed class RestaurantListState {
  const RestaurantListState();

  const factory RestaurantListState.initial() = RestaurantListInitial;
  const factory RestaurantListState.loading() = RestaurantListLoading;
  const factory RestaurantListState.loaded(List<Restaurant> restaurants) = RestaurantListLoaded;
  const factory RestaurantListState.error(String message) = RestaurantListError;
}
```

### Key Providers

1. **Auth Provider**: Manages user authentication state
2. **Restaurant Provider**: Handles restaurant data and operations
3. **Order Provider**: Manages order lifecycle
4. **Payment Provider**: Handles payment processing
5. **Profile Provider**: User profile management
6. **Settings Provider**: App configuration

## 🗃️ Data Architecture

### Core Models

#### AppUser Model
```dart
class AppUser {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final String? phoneNumber;
  final UserRole role;
  final UserStatus status;
  final DateTime createdAt;
  final DateTime updatedAt;

  // Role-based access methods
  bool hasRole(UserRole role) => this.role == role;
  bool hasAnyRole(List<UserRole> roles) => roles.contains(role);
}

enum UserRole { customer, restaurantOwner, driver, admin }
enum UserStatus { active, inactive, suspended, pendingVerification }
```

#### Restaurant Model
```dart
class Restaurant {
  final String id;
  final String name;
  final String description;
  final String address;
  final double latitude;
  final double longitude;
  final List<String> cuisineTypes;
  final double rating;
  final bool isOpen;
  final bool isPromoted;
  final String priceRange;
  final Map<String, dynamic>? contact;
  final List<String> specialties;
  final List<String> paymentMethods;
  // ... additional properties
}
```

## 🔐 Authentication Architecture

### Unified Authentication System

```dart
// Auth State Management
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final authService = ref.watch(unifiedAuthServiceProvider);
  return AuthNotifier(authService);
});

class AuthState {
  final AuthStatus status;
  final AppUser? user;
  final String? error;

  bool get isAuthenticated => status == AuthStatus.authenticated && user != null;
  bool get isLoading => status == AuthStatus.loading;
}

enum AuthStatus {
  initial,
  loading,
  authenticated,
  unauthenticated,
  twoFactorRequired,
  emailVerificationRequired,
}
```

### Route Guards

```dart
class RouteGuard {
  static String? checkAuthRoute(BuildContext context, GoRouterState state) {
    final authState = ProviderScope.containerOf(context).read(authProvider);

    if (!authState.isAuthenticated) {
      return '/login';
    }

    // Role-based access control
    if (state.matchedLocation.startsWith('/admin') &&
        !authState.user!.hasRole(UserRole.admin)) {
      return '/unauthorized';
    }

    return null; // Allow access
  }
}
```

## 🌐 Network Architecture

### API Client Configuration

```dart
class ApiClient {
  late final Dio _dio;

  ApiClient() {
    _dio = Dio(BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ));

    _setupInterceptors();
  }

  void _setupInterceptors() {
    _dio.interceptors.addAll([
      AuthInterceptor(),
      LoggingInterceptor(),
      ErrorInterceptor(),
    ]);
  }
}
```

### Service Layer Pattern

```dart
class RestaurantService {
  final ApiClient _apiClient;

  Future<List<Restaurant>> getRestaurants({
    String? searchQuery,
    String? category,
    double? latitude,
    double? longitude,
  }) async {
    final response = await _apiClient.get(
      ApiConstants.restaurants,
      queryParameters: {
        if (searchQuery != null) 'search': searchQuery,
        if (category != null) 'category': category,
        if (latitude != null) 'lat': latitude,
        if (longitude != null) 'lng': longitude,
      },
    );

    return (response.data as List)
        .map((json) => Restaurant.fromJson(json))
        .toList();
  }
}
```

## 🎨 UI Architecture

### Design System

```dart
class DesignTokens {
  // Colors
  static const Color primaryColor = Color(0xFF2E7D32);
  static const Color accentColor = Color(0xFFFF6B35);
  static const Color backgroundColor = Color(0xFFF5F5F5);

  // Spacing
  static const double spaceXS = 4.0;
  static const double spaceSM = 8.0;
  static const double spaceMD = 16.0;
  static const double spaceLG = 24.0;
  static const double spaceXL = 32.0;

  // Typography
  static const double fontSizeXS = 12.0;
  static const double fontSizeSM = 14.0;
  static const double fontSizeMD = 16.0;
  static const double fontSizeLG = 18.0;
  static const double fontSizeXL = 24.0;

  // Radius
  static const double radiusSM = 4.0;
  static const double radiusMD = 8.0;
  static const double radiusLG = 12.0;
}
```

### Widget Architecture

```dart
// Base Widget Pattern
abstract class BaseStatefulWidget extends StatefulWidget {
  const BaseStatefulWidget({super.key});
}

abstract class BaseState<T extends BaseStatefulWidget> extends State<T> {
  @override
  void initState() {
    super.initState();
    onInit();
  }

  void onInit() {}

  void showErrorSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: DesignTokens.errorColor,
      ),
    );
  }
}
```

## 📱 Feature Module Architecture

### Feature Structure Example (Restaurants)

```
features/restaurants/
├── data/
│   ├── models/
│   │   └── restaurant_dto.dart          # Data transfer objects
│   ├── repositories/
│   │   └── restaurant_repository_impl.dart
│   └── datasources/
│       ├── restaurant_remote_datasource.dart
│       └── restaurant_local_datasource.dart
├── domain/
│   ├── entities/
│   │   └── restaurant.dart              # Domain entities
│   ├── repositories/
│   │   └── restaurant_repository.dart   # Abstract repository
│   └── usecases/
│       ├── get_restaurants.dart
│       ├── search_restaurants.dart
│       └── get_restaurant_details.dart
├── presentation/
│   ├── screens/
│   │   ├── restaurant_list_screen.dart
│   │   ├── restaurant_detail_screen.dart
│   │   └── restaurant_search_screen.dart
│   ├── widgets/
│   │   ├── restaurant_card.dart
│   │   ├── restaurant_filter_bottom_sheet.dart
│   │   └── restaurant_rating_widget.dart
│   └── providers/
│       └── restaurant_provider.dart     # State management
└── providers/
    └── restaurant_provider.dart         # Feature providers
```

## 🔄 Navigation Architecture

### Go Router Configuration

```dart
final appRouter = GoRouter(
  initialLocation: '/',
  redirect: RouteGuard.checkAuthRoute,
  routes: [
    // Auth Routes
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),

    // Main App Routes
    ShellRoute(
      builder: (context, state, child) => MainLayout(child: child),
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: '/restaurants',
          builder: (context, state) => const RestaurantListScreen(),
          routes: [
            GoRoute(
              path: '/:id',
              builder: (context, state) => RestaurantDetailScreen(
                restaurantId: state.pathParameters['id']!,
              ),
            ),
          ],
        ),
      ],
    ),
  ],
);
```

## 🔧 Configuration Architecture

### Environment Configuration

```dart
enum Environment { development, staging, production }

class AppConfig {
  static Environment get environment {
    return const String.fromEnvironment('ENV') == 'production'
        ? Environment.production
        : const String.fromEnvironment('ENV') == 'staging'
            ? Environment.staging
            : Environment.development;
  }

  static String get apiBaseUrl {
    switch (environment) {
      case Environment.development:
        return 'http://localhost:3000/api';
      case Environment.staging:
        return 'https://staging-api.eatfast.com/api';
      case Environment.production:
        return 'https://api.eatfast.com/api';
    }
  }
}
```

## 📊 Performance Architecture

### Optimization Strategies

1. **Widget Optimization**
   - Use `const` constructors
   - Implement `ListView.builder` for large lists
   - Lazy loading with pagination
   - Image caching with `CachedNetworkImage`

2. **State Management Optimization**
   - Selective rebuilds with Riverpod
   - Provider families for parameterized providers
   - State disposal and cleanup

3. **Network Optimization**
   - Request caching
   - Response compression
   - Connection pooling
   - Retry mechanisms

## 🧪 Testing Architecture

### Testing Strategy

```dart
// Unit Tests
void main() {
  group('RestaurantService', () {
    late RestaurantService service;
    late MockApiClient mockApiClient;

    setUp(() {
      mockApiClient = MockApiClient();
      service = RestaurantService(mockApiClient);
    });

    test('should return restaurants when API call is successful', () async {
      // Arrange
      when(mockApiClient.get(any)).thenAnswer(
        (_) async => Response(data: mockRestaurantsJson),
      );

      // Act
      final result = await service.getRestaurants();

      // Assert
      expect(result, isA<List<Restaurant>>());
      expect(result.length, equals(2));
    });
  });
}
```

## 🔒 Security Architecture

### Security Measures

1. **Authentication Security**
   - JWT token management
   - Secure token storage
   - Token refresh mechanism
   - Biometric authentication

2. **Network Security**
   - HTTPS enforcement
   - Certificate pinning
   - Request/response encryption
   - API rate limiting

3. **Data Security**
   - Encrypted local storage
   - Secure key management
   - PII data protection
   - GDPR compliance

## 📈 Monitoring & Analytics

### Application Monitoring

```dart
class AnalyticsService {
  static void trackEvent(String event, Map<String, dynamic> parameters) {
    // Backend Web Push Analytics
    Backend Web PushAnalytics.instance.logEvent(
      name: event,
      parameters: parameters,
    );

    // Custom analytics
    CustomAnalytics.track(event, parameters);
  }

  static void trackError(Object error, StackTrace stackTrace) {
    // Crashlytics
    Backend Web PushCrashlytics.instance.recordError(error, stackTrace);

    // Sentry
    Sentry.captureException(error, stackTrace: stackTrace);
  }
}
```

## 🚀 Deployment Architecture

### Build Configuration

```yaml
# Different build flavors
flutter build apk --flavor production --release
flutter build appbundle --flavor production --release
flutter build ios --flavor production --release
```

### CI/CD Pipeline

1. **Build Stage**: Code compilation and testing
2. **Test Stage**: Unit, widget, and integration tests
3. **Quality Gate**: Code analysis and coverage
4. **Deploy Stage**: App store deployment
5. **Monitor Stage**: Performance and error monitoring

---

This architecture ensures scalability, maintainability, and robust performance while following Flutter and Dart best practices.