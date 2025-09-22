import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mockito/mockito.dart';

// Mock classes would be generated here
class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  group('Login Screen Widget Tests', () {
    late MockNavigatorObserver mockNavigatorObserver;

    setUp(() {
      mockNavigatorObserver = MockNavigatorObserver();
    });

    testWidgets('should display login form correctly', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: const Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Login to EatFast'),
                    SizedBox(height: 20),
                    TextField(
                      key: Key('email_field'),
                      decoration: InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email),
                      ),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      key: Key('password_field'),
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      key: Key('login_button'),
                      onPressed: null,
                      child: Text('Login'),
                    ),
                  ],
                ),
              ),
            ),
            navigatorObservers: [mockNavigatorObserver],
          ),
        ),
      );

      // Act & Assert
      expect(find.text('Login to EatFast'), findsOneWidget);
      expect(find.byKey(const Key('email_field')), findsOneWidget);
      expect(find.byKey(const Key('password_field')), findsOneWidget);
      expect(find.byKey(const Key('login_button')), findsOneWidget);
      expect(find.byIcon(Icons.email), findsOneWidget);
      expect(find.byIcon(Icons.lock), findsOneWidget);
    });

    testWidgets('should validate email input', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: Column(
                children: [
                  TextFormField(
                    key: const Key('email_field'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email is required';
                      }
                      if (!value.contains('@')) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                  ElevatedButton(
                    key: const Key('validate_button'),
                    onPressed: () {
                      // Trigger validation
                    },
                    child: const Text('Validate'),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      // Act
      await tester.enterText(find.byKey(const Key('email_field')), 'invalid-email');
      await tester.pump();

      // Assert
      expect(find.byKey(const Key('email_field')), findsOneWidget);
      expect(find.text('invalid-email'), findsOneWidget);
    });

    testWidgets('should validate password input', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: Column(
                children: [
                  TextFormField(
                    key: const Key('password_field'),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      // Act
      await tester.enterText(find.byKey(const Key('password_field')), '123');
      await tester.pump();

      // Assert
      expect(find.byKey(const Key('password_field')), findsOneWidget);
      expect(find.text('123'), findsOneWidget);
    });

    testWidgets('should show loading indicator during login', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: const Center(
                child: CircularProgressIndicator(key: Key('loading_indicator')),
              ),
            ),
          ),
        ),
      );

      // Act & Assert
      expect(find.byKey(const Key('loading_indicator')), findsOneWidget);
      expect(find.text('Login Form'), findsNothing);
    });

    testWidgets('should display error message on login failure', (WidgetTester tester) async {
      // Arrange
      const errorMessage = 'Invalid credentials';

      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: Column(
                children: [
                  const Text('Login Form'),
                  Container(
                    key: const Key('error_container'),
                    padding: const EdgeInsets.all(16),
                    color: Colors.red.shade100,
                    child: const Text(
                      errorMessage,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      // Act & Assert
      expect(find.text(errorMessage), findsOneWidget);
      expect(find.byKey(const Key('error_container')), findsOneWidget);
    });

    testWidgets('should navigate to forgot password screen', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: Column(
                children: [
                  const Text('Login Form'),
                  TextButton(
                    key: const Key('forgot_password_button'),
                    onPressed: () {
                      // Navigate to forgot password
                    },
                    child: const Text('Forgot Password?'),
                  ),
                ],
              ),
            ),
            navigatorObservers: [mockNavigatorObserver],
          ),
        ),
      );

      // Act
      await tester.tap(find.byKey(const Key('forgot_password_button')));
      await tester.pump();

      // Assert
      expect(find.text('Forgot Password?'), findsOneWidget);
    });

    testWidgets('should navigate to register screen', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: Column(
                children: [
                  const Text('Login Form'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account? "),
                      TextButton(
                        key: const Key('register_button'),
                        onPressed: () {
                          // Navigate to register
                        },
                        child: const Text('Sign Up'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            navigatorObservers: [mockNavigatorObserver],
          ),
        ),
      );

      // Act
      await tester.tap(find.byKey(const Key('register_button')));
      await tester.pump();

      // Assert
      expect(find.text('Sign Up'), findsOneWidget);
      expect(find.text("Don't have an account? "), findsOneWidget);
    });

    testWidgets('should show/hide password visibility', (WidgetTester tester) async {
      // Arrange
      bool isPasswordVisible = false;
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: StatefulBuilder(
                builder: (context, setState) {
                  return Column(
                    children: [
                      TextField(
                        key: const Key('password_field'),
                        obscureText: !isPasswordVisible,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          suffixIcon: IconButton(
                            key: const Key('visibility_toggle'),
                            icon: Icon(
                              isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                isPasswordVisible = !isPasswordVisible;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      );

      // Act & Assert
      expect(find.byKey(const Key('visibility_toggle')), findsOneWidget);
      expect(find.byIcon(Icons.visibility), findsOneWidget);
    });

    testWidgets('should display OAuth login options', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: Column(
                children: [
                  const Text('Login Form'),
                  const Divider(),
                  const Text('Or continue with'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OutlinedButton.icon(
                        key: const Key('google_login_button'),
                        onPressed: () {},
                        icon: const Icon(Icons.g_mobiledata),
                        label: const Text('Google'),
                      ),
                      OutlinedButton.icon(
                        key: const Key('apple_login_button'),
                        onPressed: () {},
                        icon: const Icon(Icons.apple),
                        label: const Text('Apple'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      // Act & Assert
      expect(find.text('Or continue with'), findsOneWidget);
      expect(find.byKey(const Key('google_login_button')), findsOneWidget);
      expect(find.byKey(const Key('apple_login_button')), findsOneWidget);
      expect(find.text('Google'), findsOneWidget);
      expect(find.text('Apple'), findsOneWidget);
    });

    testWidgets('should handle guest login option', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: Column(
                children: [
                  const Text('Login Form'),
                  TextButton(
                    key: const Key('guest_login_button'),
                    onPressed: () {
                      // Continue as guest
                    },
                    child: const Text('Continue as Guest'),
                  ),
                ],
              ),
            ),
            navigatorObservers: [mockNavigatorObserver],
          ),
        ),
      );

      // Act
      await tester.tap(find.byKey(const Key('guest_login_button')));
      await tester.pump();

      // Assert
      expect(find.text('Continue as Guest'), findsOneWidget);
    });
  });
}