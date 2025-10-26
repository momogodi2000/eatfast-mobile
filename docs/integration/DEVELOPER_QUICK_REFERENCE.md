# EatFast Developer Quick Reference Guide

**Last Updated**: October 26, 2025  
**For**: Backend & Mobile Developers

---

## 🚀 Quick Start Commands

### Backend (Express.js)

```bash
# Installation
cd eatfast-backend
npm install

# Development
npm run dev

# Production
npm start

# Database
npm run db:migrate
npm run db:seed

# Testing
npm test
npm run test:watch
npm run test:coverage
```

### Mobile (Flutter)

```bash
# Installation
cd eatfatsApp
flutter pub get

# Code Generation
dart run build_runner build --delete-conflicting-outputs

# Run App
flutter run

# Build
flutter build apk --release
flutter build ios --release

# Testing
flutter test
flutter test --coverage
```

---

## 📡 API Endpoints Cheat Sheet

### Base URLs
- **Development**: `http://localhost:3001/api/v1`
- **Production**: `https://api.eatfast.com/api/v1`

### Authentication
```
POST   /auth/register          # Register new user
POST   /auth/login             # Login
POST   /auth/refresh           # Refresh token
POST   /auth/logout            # Logout
GET    /auth/me                # Get current user
POST   /auth/password/reset-request
POST   /auth/2fa/setup/totp
GET    /oauth/google           # Google OAuth
```

### Guest Operations
```
POST   /guest/session          # Create guest session
GET    /guest/restaurants      # Browse restaurants
POST   /guest/cart/add         # Add to cart
POST   /guest/orders           # Create order
POST   /guest/order-tracking   # Track order
POST   /guest/convert          # Convert to user
```

### Client Operations
```
GET    /client/restaurants/search
GET    /client/restaurants/:id
POST   /client/orders
GET    /client/orders/history
GET    /client/orders/:id/track
GET    /client/loyalty/status
GET    /client/wallet
POST   /client/wallet/topup
```

### Restaurant Operations
```
GET    /restaurant/my-restaurants
POST   /restaurant/menus
GET    /restaurant/orders
PUT    /restaurant/orders/:id/status
GET    /restaurant/analytics/dashboard
```

### Driver Operations
```
PUT    /driver/availability
PUT    /driver/location
GET    /driver/orders/available
POST   /driver/orders/:id/accept
POST   /driver/deliveries/:id/complete
GET    /driver/earnings
```

### Admin Operations
```
GET    /admin/dashboard/stats
GET    /admin/users
PUT    /admin/restaurants/:id/validate
POST   /admin/orders/:id/cancel
GET    /admin/reports/financial
```

---

## 🔑 Authentication Headers

### Standard Request
```http
GET /api/v1/client/orders
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
Content-Type: application/json
```

### Guest Request
```http
GET /api/v1/guest/cart
X-Session-ID: uuid-v4-session-id
Content-Type: application/json
```

### File Upload
```http
POST /api/v1/restaurant/menus
Authorization: Bearer <token>
Content-Type: multipart/form-data
```

---

## 📦 Request/Response Formats

### Success Response
```json
{
  "success": true,
  "message": "Operation successful",
  "data": {
    // Response data
  }
}
```

### Error Response
```json
{
  "success": false,
  "error": "Error message",
  "code": "ERROR_CODE",
  "details": {
    // Additional details
  }
}
```

### Paginated Response
```json
{
  "success": true,
  "data": {
    "items": [ /* array of items */ ],
    "total": 100,
    "page": 1,
    "limit": 20,
    "hasMore": true
  }
}
```

---

## 🔒 Common Error Codes

| Code | Meaning | HTTP Status |
|------|---------|-------------|
| `AUTH_REQUIRED` | Authentication required | 401 |
| `AUTH_INVALID_TOKEN` | Invalid/expired token | 401 |
| `AUTH_INSUFFICIENT_PERMISSIONS` | No permission | 403 |
| `VALIDATION_ERROR` | Invalid input | 400 |
| `RESOURCE_NOT_FOUND` | Not found | 404 |
| `RATE_LIMIT_EXCEEDED` | Too many requests | 429 |
| `PAYMENT_FAILED` | Payment error | 402 |
| `INTERNAL_ERROR` | Server error | 500 |

---

## 📱 Flutter Code Snippets

### Make API Call
```dart
Future<List<Restaurant>> getRestaurants() async {
  final response = await _apiClient.get('/client/restaurants/search');
  
  if (response.statusCode == 200) {
    final data = response.data['data']['restaurants'] as List;
    return data.map((json) => Restaurant.fromJson(json)).toList();
  }
  
  throw Exception(response.data['error']);
}
```

### Handle Authentication
```dart
Future<void> login(String email, String password) async {
  final result = await _authService.login(
    email: email,
    password: password,
  );
  
  if (result.isSuccess) {
    // Navigate to dashboard
    Navigator.pushReplacementNamed(context, '/dashboard');
  } else {
    // Show error
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(result.message ?? 'Login failed')),
    );
  }
}
```

### Use Riverpod Provider
```dart
// Define provider
final restaurantsProvider = FutureProvider<List<Restaurant>>((ref) async {
  final service = ref.watch(restaurantServiceProvider);
  return service.getRestaurants();
});

// Use in widget
class RestaurantList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final restaurantsAsync = ref.watch(restaurantsProvider);
    
    return restaurantsAsync.when(
      data: (restaurants) => ListView.builder(
        itemCount: restaurants.length,
        itemBuilder: (context, index) => RestaurantCard(
          restaurant: restaurants[index],
        ),
      ),
      loading: () => CircularProgressIndicator(),
      error: (error, stack) => Text('Error: $error'),
    );
  }
}
```

### Store Data Securely
```dart
// Save token
await _secureStorage.write(key: 'auth_token', value: token);

// Read token
final token = await _secureStorage.read(key: 'auth_token');

// Delete token
await _secureStorage.delete(key: 'auth_token');
```

---

## 🎯 Common Tasks

### Add New API Endpoint (Backend)

1. **Create Route** (`/src/routes/module/route.js`):
```javascript
router.post('/endpoint', 
  authenticate, 
  validate(schema), 
  controller.method
);
```

2. **Create Controller** (`/src/controllers/module/controller.js`):
```javascript
exports.method = async (req, res) => {
  try {
    const result = await service.doSomething(req.body);
    res.json({ success: true, data: result });
  } catch (error) {
    res.status(500).json({ success: false, error: error.message });
  }
};
```

3. **Create Service** (`/src/services/module/service.js`):
```javascript
exports.doSomething = async (data) => {
  // Business logic here
  return result;
};
```

4. **Add Validation Schema**:
```javascript
const schema = Joi.object({
  field: Joi.string().required(),
  number: Joi.number().min(0).required()
});
```

---

### Add New Screen (Flutter)

1. **Create Screen** (`/lib/features/module/presentation/screens/`):
```dart
class MyScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text('Screen Title')),
      body: // Screen content
    );
  }
}
```

2. **Create Provider** (`/lib/features/module/providers/`):
```dart
final myProvider = StateNotifierProvider<MyNotifier, MyState>((ref) {
  return MyNotifier(ref.watch(serviceProvider));
});
```

3. **Create Service** (`/lib/features/module/data/`):
```dart
class MyService {
  final ApiClient _apiClient;
  
  MyService(this._apiClient);
  
  Future<Data> fetchData() async {
    final response = await _apiClient.get('/endpoint');
    return Data.fromJson(response.data);
  }
}
```

4. **Add Route** (`/lib/shared/config/router/`):
```dart
GoRoute(
  path: '/my-screen',
  builder: (context, state) => MyScreen(),
),
```

---

## 🗄️ Database Quick Reference

### User Model (PostgreSQL)
```sql
CREATE TABLE users (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  email VARCHAR(255) UNIQUE NOT NULL,
  phone VARCHAR(20) UNIQUE,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  password_hash TEXT,
  role user_role DEFAULT 'customer',
  status user_status DEFAULT 'active',
  loyalty_points INTEGER DEFAULT 0,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

### Common Queries
```javascript
// Sequelize examples

// Find user by email
const user = await User.findOne({ where: { email } });

// Create order
const order = await Order.create({
  userId,
  restaurantId,
  totalAmount,
  status: 'created'
});

// Update order status
await order.update({ status: 'confirmed' });

// Include related data
const order = await Order.findByPk(orderId, {
  include: [
    { model: User, as: 'customer' },
    { model: Restaurant },
    { model: OrderItem, include: [Menu] }
  ]
});
```

---

## 🧪 Testing Examples

### Backend Test (Jest)
```javascript
describe('Auth Controller', () => {
  test('should login user with valid credentials', async () => {
    const response = await request(app)
      .post('/api/v1/auth/login')
      .send({
        email: 'test@example.com',
        password: 'password123'
      });
    
    expect(response.status).toBe(200);
    expect(response.body.success).toBe(true);
    expect(response.body.data).toHaveProperty('token');
  });
});
```

### Flutter Test
```dart
void main() {
  group('AuthService', () {
    late AuthService authService;
    late MockApiClient mockApiClient;
    
    setUp(() {
      mockApiClient = MockApiClient();
      authService = AuthService(apiClient: mockApiClient);
    });
    
    test('login returns success with valid credentials', () async {
      when(mockApiClient.post(any, data: anyNamed('data')))
        .thenAnswer((_) async => Response(
          data: {'success': true, 'data': {'token': 'mock_token'}},
          statusCode: 200,
        ));
      
      final result = await authService.login(
        email: 'test@example.com',
        password: 'password123',
      );
      
      expect(result.isSuccess, true);
      expect(result.token, isNotNull);
    });
  });
}
```

---

## 🐛 Debugging Tips

### Backend Debugging

**Enable Debug Logging**:
```bash
DEBUG=* npm run dev
```

**Check Logs**:
```bash
tail -f logs/server.log
```

**Database Queries**:
```javascript
// Enable Sequelize logging
const sequelize = new Sequelize(config, {
  logging: console.log
});
```

### Mobile Debugging

**Flutter DevTools**:
```bash
flutter pub global activate devtools
flutter pub global run devtools
```

**Check Logs**:
```bash
flutter logs
adb logcat  # Android
```

**Network Debugging**:
```dart
// Add to Dio client
dio.interceptors.add(LogInterceptor(
  requestBody: true,
  responseBody: true,
));
```

---

## 🔧 Environment Configuration

### Backend (.env)
```env
NODE_ENV=development
PORT=3001
DATABASE_URL=postgresql://user:pass@localhost:5432/eatfast
JWT_SECRET=your-secret-key
JWT_REFRESH_SECRET=your-refresh-secret
GOOGLE_CLIENT_ID=your-google-client-id
CAMPAY_API_KEY=your-campay-key
```

### Mobile (lib/shared/config/app_config.dart)
```dart
class AppConfig {
  static const String apiBaseUrl = 'http://localhost:3001/api/v1';
  static const String socketUrl = 'http://localhost:3001';
  static const bool enableLogging = true;
}
```

---

## 📊 Performance Tips

### Backend
- Use database indexes for frequently queried fields
- Implement caching for expensive queries (Redis)
- Use pagination for large datasets
- Optimize N+1 queries with `include`
- Enable gzip compression

### Mobile
- Use `const` constructors where possible
- Implement lazy loading for lists
- Cache images with `cached_network_image`
- Use `ListView.builder` for long lists
- Optimize asset sizes

---

## 🚨 Common Issues & Solutions

### Issue: "Invalid token"
**Solution**: Check token expiration, refresh if needed
```dart
if (error.response?.statusCode == 401) {
  await _authService.refreshToken();
  // Retry request
}
```

### Issue: "CORS error"
**Solution**: Add origin to CORS config
```javascript
app.use(cors({
  origin: ['http://localhost:3000', 'https://app.eatfast.com']
}));
```

### Issue: "Rate limit exceeded"
**Solution**: Implement exponential backoff
```dart
Future<Response> retryRequest(Function request, {int maxRetries = 3}) async {
  for (int i = 0; i < maxRetries; i++) {
    try {
      return await request();
    } on DioException catch (e) {
      if (e.response?.statusCode == 429 && i < maxRetries - 1) {
        await Future.delayed(Duration(seconds: pow(2, i).toInt()));
        continue;
      }
      rethrow;
    }
  }
  throw Exception('Max retries exceeded');
}
```

---

## 📚 Additional Resources

### Documentation
- [API Documentation](./EATFAST_API_INTEGRATION_GUIDE.md)
- [Integration Status](./EATFAST_INTEGRATION_STATUS_REPORT.md)
- [Backend README](./eatfast-backend/README.md)
- [Mobile README](./eatfatsApp/README.md)

### External Resources
- [Express.js Docs](https://expressjs.com/)
- [Flutter Docs](https://flutter.dev/docs)
- [Riverpod Docs](https://riverpod.dev/)
- [Sequelize Docs](https://sequelize.org/)

---

## ✅ Pre-Launch Checklist

### Backend
- [ ] All environment variables configured
- [ ] Database migrations run
- [ ] SSL/HTTPS enabled
- [ ] Rate limiting configured
- [ ] Error logging enabled
- [ ] API documentation up to date
- [ ] Performance testing completed
- [ ] Security audit passed

### Mobile
- [ ] API endpoints configured
- [ ] Firebase configured
- [ ] App icons and splash screen
- [ ] ProGuard/R8 enabled (Android)
- [ ] App signing configured
- [ ] Privacy policy linked
- [ ] Terms of service linked
- [ ] App store listing ready

---

**Quick Reference Version**: 1.0  
**Last Updated**: October 26, 2025  
**Maintained By**: EatFast Development Team

---

