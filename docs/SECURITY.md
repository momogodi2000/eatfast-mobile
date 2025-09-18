# EatFast Mobile App - Security Documentation

## 🔒 Security Overview

EatFast implements comprehensive security measures to protect user data, financial transactions, and business operations. This document outlines our security architecture, practices, and guidelines.

## 🛡️ Security Architecture

### Security Layers

```
┌─────────────────────────────────────────┐
│            User Interface              │
├─────────────────────────────────────────┤
│         Authentication Layer           │
├─────────────────────────────────────────┤
│        Authorization & Access          │
├─────────────────────────────────────────┤
│         Data Encryption Layer          │
├─────────────────────────────────────────┤
│          Network Security              │
├─────────────────────────────────────────┤
│         Backend API Gateway            │
├─────────────────────────────────────────┤
│          Database Security             │
└─────────────────────────────────────────┘
```

### Security Components

| Layer | Technologies | Purpose |
|-------|--------------|---------|
| **Authentication** | JWT, OAuth 2.0, Biometrics | User identity verification |
| **Authorization** | RBAC, Route Guards | Access control |
| **Encryption** | AES-256, RSA, TLS 1.3 | Data protection |
| **Network** | Certificate Pinning, HTTPS | Secure communication |
| **Storage** | Encrypted SQLite, Keychain | Secure data persistence |

## 🔐 Authentication & Authorization

### Authentication Methods

#### 1. Multi-Factor Authentication (MFA)
```dart
class AuthService {
  // Primary authentication
  Future<AuthResult> authenticateWithPassword(String email, String password) async {
    // Verify credentials
    final user = await _verifyCredentials(email, password);

    // Check if MFA is required
    if (user.requiresMFA) {
      return AuthResult.mfaRequired(user.id);
    }

    return AuthResult.success(user);
  }

  // MFA verification
  Future<AuthResult> verifyMFA(String userId, String code, MFAMethod method) async {
    switch (method) {
      case MFAMethod.sms:
        return await _verifySMSCode(userId, code);
      case MFAMethod.email:
        return await _verifyEmailCode(userId, code);
      case MFAMethod.authenticator:
        return await _verifyTOTPCode(userId, code);
      case MFAMethod.biometric:
        return await _verifyBiometric(userId);
    }
  }
}
```

#### 2. Biometric Authentication
```dart
class BiometricAuth {
  static Future<bool> isAvailable() async {
    return await LocalAuthentication().canCheckBiometrics;
  }

  static Future<AuthResult> authenticate() async {
    try {
      final isAuthenticated = await LocalAuthentication().authenticate(
        localizedReason: 'Authenticate to access EatFast',
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
        ),
      );

      return AuthResult.success(isAuthenticated);
    } catch (e) {
      return AuthResult.error('Biometric authentication failed');
    }
  }
}
```

#### 3. OAuth 2.0 Integration
```dart
class OAuthService {
  // Google Sign-In
  Future<AuthResult> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      if (googleAuth?.accessToken != null) {
        return await _exchangeTokenForJWT(googleAuth!.accessToken!);
      }

      return AuthResult.error('Google sign-in failed');
    } catch (e) {
      return AuthResult.error('Google authentication error: $e');
    }
  }

  // Facebook Sign-In
  Future<AuthResult> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();

      if (result.status == LoginStatus.success) {
        return await _exchangeTokenForJWT(result.accessToken!.token);
      }

      return AuthResult.error('Facebook sign-in failed');
    } catch (e) {
      return AuthResult.error('Facebook authentication error: $e');
    }
  }
}
```

### Role-Based Access Control (RBAC)

#### User Roles & Permissions
```dart
enum UserRole { customer, restaurantOwner, driver, admin, support }

enum Permission {
  // Customer permissions
  placeOrder, viewOrderHistory, manageProfile, leaveReview,

  // Restaurant Owner permissions
  manageRestaurant, processOrders, viewAnalytics, manageMenu,

  // Driver permissions
  acceptDeliveries, viewEarnings, updateLocation, manageProfile,

  // Admin permissions
  manageUsers, viewSystemAnalytics, manageContent, systemConfig,

  // Support permissions
  viewUserData, resolveDisputes, accessLogs, manageTickets
}

class PermissionService {
  static bool hasPermission(UserRole role, Permission permission) {
    return _rolePermissions[role]?.contains(permission) ?? false;
  }

  static final Map<UserRole, Set<Permission>> _rolePermissions = {
    UserRole.customer: {
      Permission.placeOrder,
      Permission.viewOrderHistory,
      Permission.manageProfile,
      Permission.leaveReview,
    },
    UserRole.restaurantOwner: {
      Permission.manageRestaurant,
      Permission.processOrders,
      Permission.viewAnalytics,
      Permission.manageMenu,
      Permission.manageProfile,
    },
    // ... other roles
  };
}
```

#### Route Protection
```dart
class RouteGuard {
  static String? checkAccess(BuildContext context, GoRouterState state) {
    final authState = context.read(authProvider);

    // Check authentication
    if (!authState.isAuthenticated) {
      return '/login';
    }

    // Check permissions
    final requiredPermission = _getRequiredPermission(state.matchedLocation);
    if (requiredPermission != null &&
        !PermissionService.hasPermission(authState.user!.role, requiredPermission)) {
      return '/unauthorized';
    }

    return null;
  }

  static Permission? _getRequiredPermission(String route) {
    final routePermissions = {
      '/admin': Permission.systemConfig,
      '/restaurant/manage': Permission.manageRestaurant,
      '/driver/dashboard': Permission.acceptDeliveries,
    };

    return routePermissions[route];
  }
}
```

## 🔢 Data Encryption

### Encryption Standards

#### 1. Data at Rest
```dart
class SecureStorage {
  static const _key = 'eatfast_secure_key';

  // Encrypt sensitive data before storage
  static Future<void> storeSecurely(String key, String value) async {
    final encryptedValue = await _encrypt(value);
    await FlutterSecureStorage().write(key: key, value: encryptedValue);
  }

  // Decrypt data when retrieving
  static Future<String?> getSecurely(String key) async {
    final encryptedValue = await FlutterSecureStorage().read(key: key);
    if (encryptedValue != null) {
      return await _decrypt(encryptedValue);
    }
    return null;
  }

  static Future<String> _encrypt(String plainText) async {
    final key = encrypt.Key.fromSecureRandom(32);
    final iv = encrypt.IV.fromSecureRandom(16);
    final encrypter = encrypt.Encrypter(encrypt.AES(key));

    final encrypted = encrypter.encrypt(plainText, iv: iv);
    return '${key.base64}:${iv.base64}:${encrypted.base64}';
  }

  static Future<String> _decrypt(String encryptedText) async {
    final parts = encryptedText.split(':');
    final key = encrypt.Key.fromBase64(parts[0]);
    final iv = encrypt.IV.fromBase64(parts[1]);
    final encrypted = encrypt.Encrypted.fromBase64(parts[2]);

    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    return encrypter.decrypt(encrypted, iv: iv);
  }
}
```

#### 2. Data in Transit
```dart
class NetworkSecurity {
  static Dio createSecureDio() {
    final dio = Dio();

    // Certificate pinning
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
      client.badCertificateCallback = (cert, host, port) {
        return _validateCertificate(cert, host);
      };
      return client;
    };

    // Request/Response encryption
    dio.interceptors.add(EncryptionInterceptor());

    return dio;
  }

  static bool _validateCertificate(X509Certificate cert, String host) {
    // Validate certificate against pinned certificates
    final pinnedCerts = {
      'api.eatfast.com': 'sha256/AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=',
      'staging-api.eatfast.com': 'sha256/BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB=',
    };

    final certHash = _getCertificateHash(cert);
    return pinnedCerts[host] == certHash;
  }
}
```

### Payment Security

#### PCI DSS Compliance
```dart
class PaymentSecurity {
  // Never store card data locally
  static Future<PaymentResult> processPayment(PaymentRequest request) async {
    // Tokenize payment data
    final tokenizedData = await _tokenizePaymentData(request);

    // Send only tokens to server
    return await PaymentService.processTokenizedPayment(tokenizedData);
  }

  static Future<TokenizedPayment> _tokenizePaymentData(PaymentRequest request) async {
    // Use payment processor's tokenization service
    return await PaymentProcessor.tokenize(request);
  }

  // Validate payment data format (client-side only)
  static bool validateCardNumber(String cardNumber) {
    // Remove spaces and hyphens
    final cleanNumber = cardNumber.replaceAll(RegExp(r'[\s-]'), '');

    // Luhn algorithm validation
    return _luhnCheck(cleanNumber);
  }

  static bool _luhnCheck(String cardNumber) {
    int sum = 0;
    bool alternate = false;

    for (int i = cardNumber.length - 1; i >= 0; i--) {
      int n = int.parse(cardNumber[i]);

      if (alternate) {
        n *= 2;
        if (n > 9) n = (n % 10) + 1;
      }

      sum += n;
      alternate = !alternate;
    }

    return sum % 10 == 0;
  }
}
```

## 🌐 Network Security

### API Security

#### 1. Request Signing
```dart
class APISignature {
  static String generateSignature(String method, String url, String body, String timestamp) {
    final message = '$method$url$body$timestamp';
    final key = utf8.encode(ApiConfig.secretKey);
    final messageBytes = utf8.encode(message);

    final hmac = Hmac(sha256, key);
    final digest = hmac.convert(messageBytes);

    return base64.encode(digest.bytes);
  }

  static Map<String, String> getSignedHeaders(String method, String url, String body) {
    final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    final signature = generateSignature(method, url, body, timestamp);

    return {
      'X-Timestamp': timestamp,
      'X-Signature': signature,
      'X-API-Version': ApiConfig.version,
    };
  }
}
```

#### 2. Rate Limiting
```dart
class RateLimiter {
  static final Map<String, List<DateTime>> _requestHistory = {};
  static const int maxRequestsPerMinute = 60;

  static bool isRequestAllowed(String endpoint) {
    final now = DateTime.now();
    final requests = _requestHistory[endpoint] ?? [];

    // Remove requests older than 1 minute
    requests.removeWhere((time) => now.difference(time).inMinutes >= 1);

    if (requests.length >= maxRequestsPerMinute) {
      return false;
    }

    requests.add(now);
    _requestHistory[endpoint] = requests;
    return true;
  }
}
```

### SSL/TLS Configuration

#### Certificate Pinning Implementation
```dart
class CertificatePinning {
  static const String _prodCertSHA = 'sha256/PROD_CERT_HASH_HERE';
  static const String _stagingCertSHA = 'sha256/STAGING_CERT_HASH_HERE';

  static bool validateCertificate(String host, X509Certificate cert) {
    final certSHA = _calculateSHA256(cert.der);

    switch (host) {
      case 'api.eatfast.com':
        return certSHA == _prodCertSHA;
      case 'staging-api.eatfast.com':
        return certSHA == _stagingCertSHA;
      default:
        return false;
    }
  }

  static String _calculateSHA256(Uint8List certificate) {
    final digest = sha256.convert(certificate);
    return 'sha256/${base64.encode(digest.bytes)}';
  }
}
```

## 🔍 Input Validation & Sanitization

### Data Validation
```dart
class InputValidator {
  // Email validation
  static bool isValidEmail(String email) {
    return RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(email);
  }

  // Phone number validation
  static bool isValidPhoneNumber(String phone) {
    final cleanPhone = phone.replaceAll(RegExp(r'[\s\-\(\)]'), '');
    return RegExp(r'^\+?[1-9]\d{1,14}$').hasMatch(cleanPhone);
  }

  // Password strength validation
  static PasswordStrength checkPasswordStrength(String password) {
    if (password.length < 8) return PasswordStrength.weak;

    bool hasUpper = password.contains(RegExp(r'[A-Z]'));
    bool hasLower = password.contains(RegExp(r'[a-z]'));
    bool hasDigit = password.contains(RegExp(r'[0-9]'));
    bool hasSpecial = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

    int strength = 0;
    if (hasUpper) strength++;
    if (hasLower) strength++;
    if (hasDigit) strength++;
    if (hasSpecial) strength++;

    if (strength >= 3 && password.length >= 12) return PasswordStrength.strong;
    if (strength >= 2 && password.length >= 8) return PasswordStrength.medium;
    return PasswordStrength.weak;
  }

  // SQL injection prevention
  static String sanitizeInput(String input) {
    return input
        .replaceAll(RegExp(r"['\";]"), '')
        .replaceAll(RegExp(r'<script.*?</script>', caseSensitive: false), '')
        .replaceAll(RegExp(r'<.*?>'), '');
  }
}

enum PasswordStrength { weak, medium, strong }
```

### XSS Prevention
```dart
class XSSProtection {
  static String sanitizeHtml(String input) {
    return input
        .replaceAll('<', '&lt;')
        .replaceAll('>', '&gt;')
        .replaceAll('"', '&quot;')
        .replaceAll("'", '&#x27;')
        .replaceAll('&', '&amp;');
  }

  static bool containsMaliciousScript(String input) {
    final maliciousPatterns = [
      RegExp(r'<script.*?</script>', caseSensitive: false),
      RegExp(r'javascript:', caseSensitive: false),
      RegExp(r'on\w+\s*=', caseSensitive: false),
      RegExp(r'data:text/html', caseSensitive: false),
    ];

    return maliciousPatterns.any((pattern) => pattern.hasMatch(input));
  }
}
```

## 🗂️ Secure Data Storage

### Local Storage Security
```dart
class SecureLocalStorage {
  static const _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
      keyCipherAlgorithm: KeyCipherAlgorithm.RSA_ECB_OAEPwithSHA_256andMGF1Padding,
      storageCipherAlgorithm: StorageCipherAlgorithm.AES_GCM_NoPadding,
    ),
    iOptions: IOSOptions(
      accessibility: IOSAccessibility.first_unlock_this_device,
    ),
  );

  // Store sensitive data
  static Future<void> storeUserToken(String token) async {
    await _storage.write(key: 'user_token', value: token);
  }

  // Retrieve sensitive data
  static Future<String?> getUserToken() async {
    return await _storage.read(key: 'user_token');
  }

  // Clear all stored data (logout)
  static Future<void> clearAll() async {
    await _storage.deleteAll();
  }
}
```

### Database Security
```dart
class SecureDatabase {
  static Database? _database;

  static Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  static Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), 'eatfast_secure.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
      password: await _getDatabasePassword(),
    );
  }

  static Future<String> _getDatabasePassword() async {
    String? password = await SecureLocalStorage._storage.read(key: 'db_password');

    if (password == null) {
      password = _generateSecurePassword();
      await SecureLocalStorage._storage.write(key: 'db_password', value: password);
    }

    return password;
  }

  static String _generateSecurePassword() {
    final random = Random.secure();
    final bytes = List<int>.generate(32, (i) => random.nextInt(256));
    return base64.encode(bytes);
  }
}
```

## 🚨 Security Monitoring

### Intrusion Detection
```dart
class SecurityMonitor {
  static void detectAnomalousActivity() {
    _monitorLoginAttempts();
    _detectJailbreakRoot();
    _monitorAppIntegrity();
  }

  static void _monitorLoginAttempts() {
    // Track failed login attempts
    // Implement lockout mechanism
  }

  static Future<bool> _detectJailbreakRoot() async {
    if (Platform.isIOS) {
      return await _detectJailbreak();
    } else if (Platform.isAndroid) {
      return await _detectRoot();
    }
    return false;
  }

  static Future<bool> _detectJailbreak() async {
    // Check for jailbreak indicators
    final jailbreakPaths = [
      '/Applications/Cydia.app',
      '/usr/sbin/sshd',
      '/etc/apt',
      '/private/var/lib/apt/',
    ];

    for (final path in jailbreakPaths) {
      if (await File(path).exists()) {
        return true;
      }
    }

    return false;
  }

  static Future<bool> _detectRoot() async {
    // Check for root indicators
    final rootPaths = [
      '/system/app/Superuser.apk',
      '/sbin/su',
      '/system/bin/su',
      '/system/xbin/su',
    ];

    for (final path in rootPaths) {
      if (await File(path).exists()) {
        return true;
      }
    }

    return false;
  }
}
```

### Audit Logging
```dart
class SecurityAuditLogger {
  static void logSecurityEvent(SecurityEvent event) {
    final logEntry = {
      'timestamp': DateTime.now().toIso8601String(),
      'event_type': event.type.toString(),
      'user_id': event.userId,
      'ip_address': event.ipAddress,
      'device_id': event.deviceId,
      'details': event.details,
      'severity': event.severity.toString(),
    };

    _writeToSecureLog(logEntry);

    if (event.severity == SecuritySeverity.critical) {
      _alertSecurityTeam(logEntry);
    }
  }

  static void _writeToSecureLog(Map<String, dynamic> entry) {
    // Write to encrypted log file
    // Send to secure logging service
  }

  static void _alertSecurityTeam(Map<String, dynamic> entry) {
    // Send immediate alert to security team
  }
}

class SecurityEvent {
  final SecurityEventType type;
  final String? userId;
  final String? ipAddress;
  final String? deviceId;
  final Map<String, dynamic> details;
  final SecuritySeverity severity;

  SecurityEvent({
    required this.type,
    this.userId,
    this.ipAddress,
    this.deviceId,
    required this.details,
    required this.severity,
  });
}

enum SecurityEventType {
  loginAttempt, loginSuccess, loginFailure,
  passwordChange, profileUpdate,
  paymentAttempt, paymentSuccess, paymentFailure,
  dataAccess, dataModification,
  suspiciousActivity, securityViolation
}

enum SecuritySeverity { low, medium, high, critical }
```

## 🔧 Security Configuration

### Environment-Specific Security
```dart
class SecurityConfig {
  static bool get isDebugModeAllowed {
    return AppConfig.environment != Environment.production;
  }

  static bool get requireCertificatePinning {
    return AppConfig.environment == Environment.production;
  }

  static Duration get tokenRefreshInterval {
    switch (AppConfig.environment) {
      case Environment.development:
        return const Duration(hours: 24);
      case Environment.staging:
        return const Duration(hours: 8);
      case Environment.production:
        return const Duration(hours: 1);
    }
  }

  static int get maxLoginAttempts {
    return AppConfig.environment == Environment.production ? 3 : 10;
  }
}
```

### Security Headers
```dart
class SecurityHeaders {
  static Map<String, String> getSecurityHeaders() {
    return {
      'X-Content-Type-Options': 'nosniff',
      'X-Frame-Options': 'DENY',
      'X-XSS-Protection': '1; mode=block',
      'Strict-Transport-Security': 'max-age=31536000; includeSubDomains',
      'Content-Security-Policy': "default-src 'self'",
      'Referrer-Policy': 'strict-origin-when-cross-origin',
    };
  }
}
```

## 📋 Security Checklist

### Development Security Checklist
- [ ] All sensitive data encrypted
- [ ] Input validation implemented
- [ ] Authentication mechanisms tested
- [ ] Authorization rules enforced
- [ ] Certificate pinning configured
- [ ] API rate limiting implemented
- [ ] Secure storage utilized
- [ ] Audit logging enabled
- [ ] Error handling doesn't leak information
- [ ] Dependencies security scanned

### Deployment Security Checklist
- [ ] Debug mode disabled in production
- [ ] Logging configured appropriately
- [ ] Certificate pinning enabled
- [ ] API keys rotated
- [ ] Security monitoring active
- [ ] Incident response plan ready
- [ ] Backup and recovery tested
- [ ] Compliance requirements met

## 🚨 Incident Response

### Security Incident Response Plan

#### 1. Detection & Analysis
```dart
class IncidentDetection {
  static void analyzeSecurityIncident(SecurityIncident incident) {
    // Classify incident severity
    final severity = _classifyIncident(incident);

    // Collect evidence
    final evidence = _collectEvidence(incident);

    // Notify security team
    _notifySecurityTeam(incident, severity, evidence);
  }

  static IncidentSeverity _classifyIncident(SecurityIncident incident) {
    // Implement incident classification logic
    return IncidentSeverity.medium;
  }
}
```

#### 2. Containment & Recovery
- Isolate affected systems
- Prevent further damage
- Preserve evidence
- Implement temporary fixes
- Monitor for continued threats

#### 3. Communication
- Internal notification procedures
- User communication (if needed)
- Regulatory reporting (if required)
- Public disclosure (if necessary)

## 📞 Security Contacts

### Security Team
- **Security Officer**: security@eatfast.com
- **Emergency Hotline**: +1-555-SECURITY
- **Bug Bounty Program**: bugbounty@eatfast.com
- **Compliance Team**: compliance@eatfast.com

### Reporting Security Issues
1. **Email**: security@eatfast.com
2. **Encrypted Communication**: Use PGP key on our website
3. **Bug Bounty Platform**: HackerOne
4. **Anonymous Tip Line**: +1-555-TIP-LINE

---

**Security is a shared responsibility. Report suspicious activities immediately.**