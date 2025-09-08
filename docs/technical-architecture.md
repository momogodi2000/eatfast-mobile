# Technical Architecture - EatFast Mobile App

## System Overview

The EatFast mobile application is a comprehensive food delivery platform built for the Cameroon market, featuring modern Flutter architecture, robust state management, and extensive testing infrastructure.

## Architecture Principles

### Clean Architecture
The app follows Clean Architecture principles with clear separation of concerns:
- **Presentation Layer**: UI components, widgets, and user interactions
- **Domain Layer**: Business logic, entities, and use cases
- **Data Layer**: Repositories, data sources, and external service integrations
- **Infrastructure Layer**: Framework-specific implementations and utilities

### SOLID Principles
- **Single Responsibility**: Each class has one reason to change
- **Open/Closed**: Open for extension, closed for modification
- **Liskov Substitution**: Subtypes are substitutable for their base types
- **Interface Segregation**: Clients depend only on methods they use
- **Dependency Inversion**: Depend on abstractions, not concretions

## Technical Stack

### Core Framework
```yaml
Flutter: 3.8.1+
Dart: 3.8.1+
Material Design 3: Latest
```

### State Management
```yaml
flutter_riverpod: ^2.4.9
riverpod_annotation: ^2.3.5
async_value: Built-in
```

### Networking
```yaml
dio: ^5.4.3+1
retrofit: ^4.1.0
pretty_dio_logger: ^1.3.1
json_serializable: ^6.7.1
```

### Local Storage
```yaml
shared_preferences: ^2.2.3
hive: ^2.2.3
flutter_secure_storage: ^9.2.2
```

### Authentication & Security
```yaml
google_sign_in: ^6.2.1
local_auth: ^2.2.0
sign_in_with_apple: ^6.1.0
crypto: ^3.0.3
```

### Maps & Location
```yaml
google_maps_flutter: ^2.6.0
location: ^6.0.2
geocoding: ^3.0.0
geolocator: ^10.1.0
```

### UI & Animations
```yaml
lottie: ^3.1.2
shimmer: ^3.0.0
flutter_staggered_animations: ^1.1.1
cached_network_image: ^3.3.1
```

### Notifications
```yaml
firebase_core: ^2.31.0
firebase_messaging: ^14.9.2
flutter_local_notifications: ^17.1.2
awesome_notifications: ^0.8.3
```

### Payment Integration
```yaml
stripe_payment: ^1.0.11
flutter_stripe: ^10.1.1
pay: ^1.1.2
```

### Internationalization
```yaml
flutter_localizations: SDK
intl: ^0.19.0
easy_localization: ^3.0.3
```

### Testing Framework
```yaml
flutter_test: SDK
mockito: ^5.4.4
bloc_test: ^9.1.5
integration_test: SDK
```

## Project Structure

### Feature-Based Architecture
```
lib/
├── core/                          # Core functionality
│   ├── theme/                     # App theming
│   ├── network/                   # API client
│   ├── security/                  # Security services
│   ├── l10n/                      # Internationalization
│   ├── utils/                     # Utilities
│   └── constants/                 # App constants
├── features/                      # Feature modules
│   ├── auth/                      # Authentication
│   │   ├── domain/
│   │   ├── data/
│   │   ├── presentation/
│   │   └── providers/
│   ├── restaurants/               # Restaurant discovery
│   ├── orders/                    # Order management
│   ├── payments/                  # Payment processing
│   ├── profile/                   # User profile
│   ├── loyalty/                   # Loyalty program
│   ├── group_orders/              # Group ordering
│   ├── wearables/                 # Wearable integration
│   ├── corporate/                 # Corporate features
│   ├── franchise/                 # Franchise management
│   └── admin/                     # Admin features
├── shared/                        # Shared components
│   ├── widgets/                   # Reusable widgets
│   ├── models/                    # Shared models
│   └── constants/                 # Shared constants
└── main.dart                      # App entry point
```

### File Organization
- **Domain Layer**: Contains business logic, entities, and use cases
- **Data Layer**: Contains repositories, data sources, and DTOs
- **Presentation Layer**: Contains UI screens, widgets, and state management
- **Providers**: Contains Riverpod providers and state management logic

## State Management

### Riverpod Implementation
```dart
// Provider definition
@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  AuthState build() {
    return const AuthState.initial();
  }

  Future<void> signIn(String email, String password) async {
    state = const AsyncValue.loading();
    try {
      final user = await _authRepository.signIn(email, password);
      state = AsyncValue.data(AuthState.authenticated(user));
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}

// Usage in widgets
class SignInButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);

    return authState.when(
      data: (authState) => ElevatedButton(
        onPressed: authState.isAuthenticated ? null : _signIn,
        child: const Text('Sign In'),
      ),
      loading: () => const CircularProgressIndicator(),
      error: (error, _) => Text('Error: $error'),
    );
  }
}
```

### State Flow
1. **User Interaction**: Widget triggers state change
2. **Provider Update**: Notifier updates state with async operations
3. **UI Rebuild**: Widgets rebuild based on new state
4. **Persistence**: State saved to local storage
5. **Synchronization**: Data synced with backend services

## Networking Architecture

### API Client Setup
```dart
class ApiClient {
  late final Dio _dio;
  late final RestClient _restClient;

  ApiClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.apiBaseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    _setupInterceptors();
    _restClient = RestClient(_dio);
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

### Repository Pattern
```dart
abstract class RestaurantRepository {
  Future<List<Restaurant>> getRestaurants({
    required int page,
    required int limit,
    String? cuisine,
    String? searchQuery,
  });

  Future<Restaurant> getRestaurant(String id);
  Future<List<MenuItem>> getMenuItems(String restaurantId);
}

class RestaurantRepositoryImpl implements RestaurantRepository {
  final RestClient _restClient;

  RestaurantRepositoryImpl(this._restClient);

  @override
  Future<List<Restaurant>> getRestaurants({
    required int page,
    required int limit,
    String? cuisine,
    String? searchQuery,
  }) async {
    final response = await _restClient.getRestaurants(
      page: page,
      limit: limit,
      cuisine: cuisine,
      searchQuery: searchQuery,
    );
    return response.data.map((dto) => dto.toEntity()).toList();
  }
}
```

## Data Models

### Entity Models
```dart
@freezed
class User with _$User {
  const factory User({
    required String id,
    required String email,
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required UserRole role,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class Restaurant with _$Restaurant {
  const factory Restaurant({
    required String id,
    required String name,
    required String description,
    required String imageUrl,
    required double rating,
    required int reviewCount,
    required String cuisine,
    required Address address,
    required OperatingHours operatingHours,
    required double deliveryFee,
    required int deliveryTime,
    required bool isOpen,
  }) = _Restaurant;

  factory Restaurant.fromJson(Map<String, dynamic> json) => _$RestaurantFromJson(json);
}
```

### DTOs (Data Transfer Objects)
```dart
@freezed
class RestaurantDto with _$RestaurantDto {
  const factory RestaurantDto({
    required String id,
    required String name,
    required String description,
    required String imageUrl,
    required double rating,
    required int reviewCount,
    required String cuisine,
    required AddressDto address,
    required OperatingHoursDto operatingHours,
    required double deliveryFee,
    required int deliveryTime,
    required bool isOpen,
  }) = _RestaurantDto;

  factory RestaurantDto.fromJson(Map<String, dynamic> json) => _$RestaurantDtoFromJson(json);
}
```

## UI Architecture

### Widget Composition
```dart
class RestaurantCard extends StatelessWidget {
  const RestaurantCard({
    super.key,
    required this.restaurant,
    required this.onTap,
  });

  final Restaurant restaurant;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RestaurantImage(imageUrl: restaurant.imageUrl),
              const SizedBox(height: 12),
              RestaurantInfo(restaurant: restaurant),
              const SizedBox(height: 8),
              RestaurantStats(restaurant: restaurant),
            ],
          ),
        ),
      ),
    );
  }
}
```

### Screen Architecture
```dart
class RestaurantsScreen extends ConsumerWidget {
  const RestaurantsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final restaurantsState = ref.watch(restaurantsNotifierProvider);

    return Scaffold(
      appBar: const RestaurantsAppBar(),
      body: restaurantsState.when(
        data: (restaurants) => RestaurantsList(restaurants: restaurants),
        loading: () => const RestaurantsLoadingView(),
        error: (error, _) => RestaurantsErrorView(error: error),
      ),
      floatingActionButton: const FilterButton(),
    );
  }
}
```

## Testing Architecture

### Unit Testing
```dart
void main() {
  late MockRestaurantRepository mockRepository;
  late RestaurantsNotifier notifier;

  setUp(() {
    mockRepository = MockRestaurantRepository();
    notifier = RestaurantsNotifier(mockRepository);
  });

  group('RestaurantsNotifier', () {
    test('should emit loading state when fetching restaurants', () async {
      when(mockRepository.getRestaurants())
          .thenAnswer((_) async => []);

      final states = <AsyncValue<List<Restaurant>>>[];
      notifier.addListener((state) => states.add(state));

      await notifier.loadRestaurants();

      expect(states[0], const AsyncValue.loading());
    });

    test('should emit data state when restaurants are fetched successfully', () async {
      final restaurants = [testRestaurant];
      when(mockRepository.getRestaurants())
          .thenAnswer((_) async => restaurants);

      await notifier.loadRestaurants();

      expect(notifier.state, AsyncValue.data(restaurants));
    });
  });
}
```

### Widget Testing
```dart
void main() {
  testWidgets('RestaurantCard displays restaurant information', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RestaurantCard(
            restaurant: testRestaurant,
            onTap: () {},
          ),
        ),
      ),
    );

    expect(find.text('Test Restaurant'), findsOneWidget);
    expect(find.text('4.5'), findsOneWidget);
    expect(find.text('Italian'), findsOneWidget);
  });

  testWidgets('RestaurantCard calls onTap when tapped', (tester) async {
    var tapped = false;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RestaurantCard(
            restaurant: testRestaurant,
            onTap: () => tapped = true,
          ),
        ),
      ),
    );

    await tester.tap(find.byType(RestaurantCard));
    await tester.pump();

    expect(tapped, true);
  });
}
```

### Integration Testing
```dart
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Complete restaurant discovery flow', (tester) async {
    await tester.pumpWidget(const EatFastApp());
    await tester.pumpAndSettle();

    // Navigate to restaurants
    await tester.tap(find.text('Restaurants'));
    await tester.pumpAndSettle();

    // Select restaurant
    await tester.tap(find.text('Test Restaurant'));
    await tester.pumpAndSettle();

    // Verify restaurant details are displayed
    expect(find.text('Test Restaurant'), findsOneWidget);
    expect(find.text('Restaurant Description'), findsOneWidget);
  });
}
```

## Security Architecture

### Authentication Flow
```dart
class AuthService {
  final FlutterSecureStorage _secureStorage;
  final Dio _dio;

  Future<String?> getAccessToken() async {
    return await _secureStorage.read(key: 'access_token');
  }

  Future<void> refreshToken() async {
    final refreshToken = await _secureStorage.read(key: 'refresh_token');
    if (refreshToken == null) throw const AuthException('No refresh token');

    final response = await _dio.post('/auth/refresh', data: {
      'refreshToken': refreshToken,
    });

    final newAccessToken = response.data['accessToken'];
    await _secureStorage.write(key: 'access_token', value: newAccessToken);
  }
}
```

### Data Encryption
```dart
class SecureStorageService {
  final FlutterSecureStorage _storage;

  Future<void> writeSecureData(String key, String value) async {
    final encryptedValue = _encrypt(value);
    await _storage.write(key: key, value: encryptedValue);
  }

  String _encrypt(String value) {
    final key = Key.fromUtf8('32-character-encryption-key');
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key));
    final encrypted = encrypter.encrypt(value, iv: iv);
    return encrypted.base64;
  }
}
```

## Performance Optimization

### Image Optimization
```dart
class OptimizedImage extends StatelessWidget {
  const OptimizedImage({
    super.key,
    required this.imageUrl,
    required this.width,
    required this.height,
  });

  final String imageUrl;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: BoxFit.cover,
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          width: width,
          height: height,
          color: Colors.white,
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
```

### List Optimization
```dart
class OptimizedRestaurantList extends StatelessWidget {
  const OptimizedRestaurantList({super.key, required this.restaurants});

  final List<Restaurant> restaurants;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: restaurants.length,
      itemBuilder: (context, index) {
        final restaurant = restaurants[index];
        return RestaurantListItem(
          key: ValueKey(restaurant.id),
          restaurant: restaurant,
          onTap: () => _onRestaurantTap(restaurant),
        );
      },
    );
  }
}
```

## Deployment Architecture

### Build Configuration
```yaml
# pubspec.yaml
name: eatfast_mobile
version: 2.0.0+200

environment:
  sdk: '>=3.0.0 <4.0.0'
  flutter: '>=3.8.0'

dependencies:
  flutter:
    sdk: flutter
  # ... other dependencies

flutter:
  uses-material-design: true
  assets:
    - assets/images/
    - assets/lottie/
  fonts:
    - family: Poppins
      fonts:
        - asset: assets/fonts/Poppins-Regular.ttf
        - asset: assets/fonts/Poppins-Medium.ttf
        - asset: assets/fonts/Poppins-SemiBold.ttf
        - asset: assets/fonts/Poppins-Bold.ttf
```

### CI/CD Pipeline
```yaml
# .github/workflows/build.yml
name: Build and Test

on:
  push:
    branches: [main, develop]
  pull_request:
    branches: [main]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: subosito/flutter-action@v2
        with:
          flutter-version: '3.8.1'
      - run: flutter pub get
      - run: flutter test --coverage
      - uses: codecov/codecov-action@v3

  build-android:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: subosito/flutter-action@v2
        with:
          flutter-version: '3.8.1'
      - run: flutter build apk --release

  build-ios:
    runs-on: macos-latest
    steps:
      - uses: actions/checkout@v3
      - uses: subosito/flutter-action@v2
        with:
          flutter-version: '3.8.1'
      - run: flutter build ios --release --no-codesign
```

## Monitoring & Analytics

### Error Tracking
```dart
class ErrorReportingService {
  final FirebaseCrashlytics _crashlytics;

  Future<void> reportError(dynamic error, StackTrace stackTrace) async {
    await _crashlytics.recordError(error, stackTrace);
  }

  Future<void> logEvent(String name, Map<String, dynamic> parameters) async {
    await FirebaseAnalytics.instance.logEvent(
      name: name,
      parameters: parameters,
    );
  }
}
```

### Performance Monitoring
```dart
class PerformanceMonitoringService {
  final FirebasePerformance _performance;

  Future<void> startTrace(String name) async {
    final trace = _performance.newTrace(name);
    await trace.start();
    return trace;
  }

  Future<void> stopTrace(Trace trace) async {
    await trace.stop();
  }
}
```

## Conclusion

The EatFast mobile app demonstrates a robust, scalable architecture built with modern Flutter practices. The feature-based modular structure, comprehensive testing strategy, and clean code principles ensure maintainability and extensibility for future development.

The architecture supports:
- **Scalability**: Modular design allows easy feature addition
- **Testability**: Comprehensive testing at all levels
- **Maintainability**: Clean code principles and documentation
- **Performance**: Optimized for mobile devices and networks
- **Security**: Robust authentication and data protection
- **User Experience**: Modern UI with smooth interactions

This technical foundation provides a solid base for the continued growth and success of the EatFast platform in Cameroon. 🇨🇲📱
