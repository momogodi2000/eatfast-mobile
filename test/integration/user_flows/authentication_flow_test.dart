import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Authentication Flow Integration Tests', () {
    testWidgets('should complete login flow successfully', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: const MockLoginScreen(),
            routes: {
              '/home': (context) => const MockHomeScreen(),
              '/forgot-password': (context) => const MockForgotPasswordScreen(),
            },
          ),
        ),
      );

      // Step 1: Verify login screen elements
      expect(find.text('Login to EatFast'), findsOneWidget);
      expect(find.byKey(const Key('email_field')), findsOneWidget);
      expect(find.byKey(const Key('password_field')), findsOneWidget);
      expect(find.byKey(const Key('login_button')), findsOneWidget);

      // Step 2: Enter valid credentials
      await tester.enterText(find.byKey(const Key('email_field')), 'test@example.com');
      await tester.pump();
      await tester.enterText(find.byKey(const Key('password_field')), 'password123');
      await tester.pump();

      // Step 3: Tap login button
      await tester.tap(find.byKey(const Key('login_button')));
      await tester.pump();

      // Step 4: Verify loading state
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Logging in...'), findsOneWidget);

      // Step 5: Wait for navigation to home
      await tester.pumpAndSettle();
      expect(find.text('Welcome to EatFast'), findsOneWidget);
    });

    testWidgets('should handle login validation errors', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: const MockLoginScreen(),
          ),
        ),
      );

      // Step 1: Try to login without email
      await tester.tap(find.byKey(const Key('login_button')));
      await tester.pump();

      // Verify validation error
      expect(find.text('Email is required'), findsOneWidget);

      // Step 2: Enter invalid email format
      await tester.enterText(find.byKey(const Key('email_field')), 'invalid-email');
      await tester.pump();
      await tester.tap(find.byKey(const Key('login_button')));
      await tester.pump();

      // Verify email format error
      expect(find.text('Please enter a valid email'), findsOneWidget);

      // Step 3: Enter valid email but no password
      await tester.enterText(find.byKey(const Key('email_field')), 'test@example.com');
      await tester.pump();
      await tester.tap(find.byKey(const Key('login_button')));
      await tester.pump();

      // Verify password validation
      expect(find.text('Password is required'), findsOneWidget);

      // Step 4: Enter short password
      await tester.enterText(find.byKey(const Key('password_field')), '123');
      await tester.pump();
      await tester.tap(find.byKey(const Key('login_button')));
      await tester.pump();

      // Verify password length validation
      expect(find.text('Password must be at least 6 characters'), findsOneWidget);
    });

    testWidgets('should handle forgot password flow', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: const MockLoginScreen(),
            routes: {
              '/forgot-password': (context) => const MockForgotPasswordScreen(),
            },
          ),
        ),
      );

      // Step 1: Tap forgot password link
      await tester.tap(find.byKey(const Key('forgot_password_button')));
      await tester.pumpAndSettle();

      // Step 2: Verify forgot password screen
      expect(find.text('Reset Password'), findsOneWidget);
      expect(find.text('Enter your email to receive reset instructions'), findsOneWidget);

      // Step 3: Enter email for reset
      await tester.enterText(find.byKey(const Key('reset_email_field')), 'test@example.com');
      await tester.pump();

      // Step 4: Send reset email
      await tester.tap(find.byKey(const Key('send_reset_button')));
      await tester.pump();

      // Step 5: Verify success message
      expect(find.text('Reset instructions sent to your email'), findsOneWidget);
    });

    testWidgets('should complete registration flow', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: const MockRegistrationScreen(),
            routes: {
              '/home': (context) => const MockHomeScreen(),
              '/email-verification': (context) => const MockEmailVerificationScreen(),
            },
          ),
        ),
      );

      // Step 1: Verify registration form
      expect(find.text('Create Account'), findsOneWidget);
      expect(find.byKey(const Key('first_name_field')), findsOneWidget);
      expect(find.byKey(const Key('last_name_field')), findsOneWidget);
      expect(find.byKey(const Key('email_field')), findsOneWidget);
      expect(find.byKey(const Key('password_field')), findsOneWidget);
      expect(find.byKey(const Key('confirm_password_field')), findsOneWidget);

      // Step 2: Fill registration form
      await tester.enterText(find.byKey(const Key('first_name_field')), 'John');
      await tester.pump();
      await tester.enterText(find.byKey(const Key('last_name_field')), 'Doe');
      await tester.pump();
      await tester.enterText(find.byKey(const Key('email_field')), 'john.doe@example.com');
      await tester.pump();
      await tester.enterText(find.byKey(const Key('password_field')), 'password123');
      await tester.pump();
      await tester.enterText(find.byKey(const Key('confirm_password_field')), 'password123');
      await tester.pump();

      // Step 3: Accept terms and conditions
      await tester.tap(find.byKey(const Key('terms_checkbox')));
      await tester.pump();

      // Step 4: Submit registration
      await tester.tap(find.byKey(const Key('register_button')));
      await tester.pump();

      // Step 5: Verify loading state
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Creating account...'), findsOneWidget);

      // Step 6: Navigate to email verification
      await tester.pumpAndSettle();
      expect(find.text('Verify Your Email'), findsOneWidget);
    });

    testWidgets('should handle registration validation', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: const MockRegistrationScreen(),
          ),
        ),
      );

      // Step 1: Try to register without filling fields
      await tester.tap(find.byKey(const Key('register_button')));
      await tester.pump();

      // Verify validation errors
      expect(find.text('First name is required'), findsOneWidget);
      expect(find.text('Last name is required'), findsOneWidget);
      expect(find.text('Email is required'), findsOneWidget);

      // Step 2: Test password mismatch
      await tester.enterText(find.byKey(const Key('first_name_field')), 'John');
      await tester.enterText(find.byKey(const Key('last_name_field')), 'Doe');
      await tester.enterText(find.byKey(const Key('email_field')), 'john@example.com');
      await tester.enterText(find.byKey(const Key('password_field')), 'password123');
      await tester.enterText(find.byKey(const Key('confirm_password_field')), 'different');
      await tester.pump();

      await tester.tap(find.byKey(const Key('register_button')));
      await tester.pump();

      // Verify password mismatch error
      expect(find.text('Passwords do not match'), findsOneWidget);

      // Step 3: Test terms acceptance
      await tester.enterText(find.byKey(const Key('confirm_password_field')), 'password123');
      await tester.pump();
      await tester.tap(find.byKey(const Key('register_button')));
      await tester.pump();

      // Verify terms validation
      expect(find.text('Please accept the terms and conditions'), findsOneWidget);
    });

    testWidgets('should handle email verification flow', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: const MockEmailVerificationScreen(),
            routes: {
              '/home': (context) => const MockHomeScreen(),
            },
          ),
        ),
      );

      // Step 1: Verify email verification screen
      expect(find.text('Verify Your Email'), findsOneWidget);
      expect(find.text('We sent a verification code to your email'), findsOneWidget);

      // Step 2: Enter verification code
      await tester.enterText(find.byKey(const Key('verification_code_field')), '123456');
      await tester.pump();

      // Step 3: Verify code
      await tester.tap(find.byKey(const Key('verify_button')));
      await tester.pump();

      // Step 4: Show loading and navigate to home
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pumpAndSettle();
      expect(find.text('Welcome to EatFast'), findsOneWidget);

      // Step 5: Test resend code functionality
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: const MockEmailVerificationScreen(),
          ),
        ),
      );

      await tester.tap(find.byKey(const Key('resend_code_button')));
      await tester.pump();

      // Verify resend confirmation
      expect(find.text('Verification code resent'), findsOneWidget);
    });

    testWidgets('should handle OAuth login flows', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: const MockLoginScreen(),
            routes: {
              '/home': (context) => const MockHomeScreen(),
            },
          ),
        ),
      );

      // Step 1: Test Google OAuth
      await tester.tap(find.byKey(const Key('google_login_button')));
      await tester.pump();

      // Verify Google OAuth loading
      expect(find.text('Signing in with Google...'), findsOneWidget);
      await tester.pump(const Duration(seconds: 2));

      // Step 2: Test Apple OAuth
      await tester.tap(find.byKey(const Key('apple_login_button')));
      await tester.pump();

      // Verify Apple OAuth loading
      expect(find.text('Signing in with Apple...'), findsOneWidget);
      await tester.pump(const Duration(seconds: 2));
    });

    testWidgets('should handle guest login flow', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: const MockLoginScreen(),
            routes: {
              '/home': (context) => const MockHomeScreen(),
            },
          ),
        ),
      );

      // Step 1: Continue as guest
      await tester.tap(find.byKey(const Key('guest_login_button')));
      await tester.pumpAndSettle();

      // Step 2: Verify navigation to home with guest access
      expect(find.text('Welcome to EatFast'), findsOneWidget);
      expect(find.text('Guest Mode'), findsOneWidget);
    });

    testWidgets('should handle password visibility toggle', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: const MockLoginScreen(),
          ),
        ),
      );

      // Step 1: Enter password
      await tester.enterText(find.byKey(const Key('password_field')), 'password123');
      await tester.pump();

      // Step 2: Verify password is obscured initially
      final passwordField = tester.widget<TextField>(find.byKey(const Key('password_field')));
      expect(passwordField.obscureText, isTrue);

      // Step 3: Toggle password visibility
      await tester.tap(find.byKey(const Key('password_visibility_toggle')));
      await tester.pump();

      // Step 4: Verify password is now visible
      final updatedPasswordField = tester.widget<TextField>(find.byKey(const Key('password_field')));
      expect(updatedPasswordField.obscureText, isFalse);

      // Step 5: Toggle back to obscured
      await tester.tap(find.byKey(const Key('password_visibility_toggle')));
      await tester.pump();

      final finalPasswordField = tester.widget<TextField>(find.byKey(const Key('password_field')));
      expect(finalPasswordField.obscureText, isTrue);
    });
  });
}

// Mock Screens for Authentication Testing

class MockLoginScreen extends StatefulWidget {
  const MockLoginScreen({super.key});

  @override
  State<MockLoginScreen> createState() => _MockLoginScreenState();
}

class _MockLoginScreenState extends State<MockLoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _obscurePassword = true;
  String? _emailError;
  String? _passwordError;

  void _validateAndLogin() {
    setState(() {
      _emailError = null;
      _passwordError = null;
    });

    final email = _emailController.text.trim();
    final password = _passwordController.text;

    if (email.isEmpty) {
      setState(() => _emailError = 'Email is required');
      return;
    }

    if (!email.contains('@')) {
      setState(() => _emailError = 'Please enter a valid email');
      return;
    }

    if (password.isEmpty) {
      setState(() => _passwordError = 'Password is required');
      return;
    }

    if (password.length < 6) {
      setState(() => _passwordError = 'Password must be at least 6 characters');
      return;
    }

    setState(() => _isLoading = true);

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Logging in...'),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Login to EatFast',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 32),
                  TextField(
                    key: const Key('email_field'),
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      errorText: _emailError,
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    key: const Key('password_field'),
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      errorText: _passwordError,
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        key: const Key('password_visibility_toggle'),
                        icon: Icon(_obscurePassword ? Icons.visibility : Icons.visibility_off),
                        onPressed: () {
                          setState(() => _obscurePassword = !_obscurePassword);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      key: const Key('login_button'),
                      onPressed: _validateAndLogin,
                      child: const Text('Login'),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    key: const Key('forgot_password_button'),
                    onPressed: () => Navigator.pushNamed(context, '/forgot-password'),
                    child: const Text('Forgot Password?'),
                  ),
                  const SizedBox(height: 24),
                  const Text('Or continue with'),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          key: const Key('google_login_button'),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Signing in with Google...')),
                            );
                          },
                          child: const Text('Google'),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: OutlinedButton(
                          key: const Key('apple_login_button'),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Signing in with Apple...')),
                            );
                          },
                          child: const Text('Apple'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    key: const Key('guest_login_button'),
                    onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
                    child: const Text('Continue as Guest'),
                  ),
                ],
              ),
            ),
    );
  }
}

class MockRegistrationScreen extends StatefulWidget {
  const MockRegistrationScreen({super.key});

  @override
  State<MockRegistrationScreen> createState() => _MockRegistrationScreenState();
}

class _MockRegistrationScreenState extends State<MockRegistrationScreen> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isLoading = false;
  bool _acceptTerms = false;
  String? _firstNameError;
  String? _lastNameError;
  String? _emailError;
  String? _passwordError;
  String? _confirmPasswordError;
  String? _termsError;

  void _validateAndRegister() {
    setState(() {
      _firstNameError = null;
      _lastNameError = null;
      _emailError = null;
      _passwordError = null;
      _confirmPasswordError = null;
      _termsError = null;
    });

    if (_firstNameController.text.trim().isEmpty) {
      setState(() => _firstNameError = 'First name is required');
      return;
    }

    if (_lastNameController.text.trim().isEmpty) {
      setState(() => _lastNameError = 'Last name is required');
      return;
    }

    if (_emailController.text.trim().isEmpty) {
      setState(() => _emailError = 'Email is required');
      return;
    }

    if (_passwordController.text != _confirmPasswordController.text) {
      setState(() => _confirmPasswordError = 'Passwords do not match');
      return;
    }

    if (!_acceptTerms) {
      setState(() => _termsError = 'Please accept the terms and conditions');
      return;
    }

    setState(() => _isLoading = true);

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/email-verification');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Account')),
      body: _isLoading
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Creating account...'),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  TextField(
                    key: const Key('first_name_field'),
                    controller: _firstNameController,
                    decoration: InputDecoration(
                      labelText: 'First Name',
                      errorText: _firstNameError,
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    key: const Key('last_name_field'),
                    controller: _lastNameController,
                    decoration: InputDecoration(
                      labelText: 'Last Name',
                      errorText: _lastNameError,
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    key: const Key('email_field'),
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      errorText: _emailError,
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    key: const Key('password_field'),
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      errorText: _passwordError,
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    key: const Key('confirm_password_field'),
                    controller: _confirmPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      errorText: _confirmPasswordError,
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  CheckboxListTile(
                    key: const Key('terms_checkbox'),
                    value: _acceptTerms,
                    onChanged: (value) => setState(() => _acceptTerms = value ?? false),
                    title: const Text('I accept the Terms and Conditions'),
                    contentPadding: EdgeInsets.zero,
                  ),
                  if (_termsError != null)
                    Text(_termsError!, style: const TextStyle(color: Colors.red)),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      key: const Key('register_button'),
                      onPressed: _validateAndRegister,
                      child: const Text('Create Account'),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

class MockForgotPasswordScreen extends StatefulWidget {
  const MockForgotPasswordScreen({super.key});

  @override
  State<MockForgotPasswordScreen> createState() => _MockForgotPasswordScreenState();
}

class _MockForgotPasswordScreenState extends State<MockForgotPasswordScreen> {
  final _emailController = TextEditingController();
  bool _emailSent = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reset Password')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text('Enter your email to receive reset instructions'),
            const SizedBox(height: 24),
            TextField(
              key: const Key('reset_email_field'),
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                key: const Key('send_reset_button'),
                onPressed: () {
                  setState(() => _emailSent = true);
                },
                child: const Text('Send Reset Instructions'),
              ),
            ),
            if (_emailSent)
              const Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text(
                  'Reset instructions sent to your email',
                  style: TextStyle(color: Colors.green),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class MockEmailVerificationScreen extends StatefulWidget {
  const MockEmailVerificationScreen({super.key});

  @override
  State<MockEmailVerificationScreen> createState() => _MockEmailVerificationScreenState();
}

class _MockEmailVerificationScreenState extends State<MockEmailVerificationScreen> {
  final _codeController = TextEditingController();
  bool _isLoading = false;
  bool _codeResent = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Verify Your Email')),
      body: _isLoading
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Verifying code...'),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Text('We sent a verification code to your email'),
                  const SizedBox(height: 24),
                  TextField(
                    key: const Key('verification_code_field'),
                    controller: _codeController,
                    decoration: const InputDecoration(
                      labelText: 'Verification Code',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      key: const Key('verify_button'),
                      onPressed: () {
                        setState(() => _isLoading = true);
                        Future.delayed(const Duration(seconds: 2), () {
                          Navigator.pushReplacementNamed(context, '/home');
                        });
                      },
                      child: const Text('Verify'),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    key: const Key('resend_code_button'),
                    onPressed: () {
                      setState(() => _codeResent = true);
                    },
                    child: const Text('Resend Code'),
                  ),
                  if (_codeResent)
                    const Text(
                      'Verification code resent',
                      style: TextStyle(color: Colors.green),
                    ),
                ],
              ),
            ),
    );
  }
}

class MockHomeScreen extends StatelessWidget {
  const MockHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('EatFast')),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to EatFast',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text('Guest Mode'),
          ],
        ),
      ),
    );
  }
}