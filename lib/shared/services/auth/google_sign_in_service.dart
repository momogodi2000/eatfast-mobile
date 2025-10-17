import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// Google Sign-In Service
/// Handles Google OAuth authentication
class GoogleSignInService {
  final GoogleSignIn _googleSignIn;

  GoogleSignInService({GoogleSignIn? googleSignIn})
      : _googleSignIn = googleSignIn ??
            GoogleSignIn(
              scopes: [
                'email',
                'profile',
              ],
            );

  /// Sign in with Google
  /// Returns the ID token if successful, null otherwise
  Future<String?> signIn() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? account = await _googleSignIn.signIn();

      if (account == null) {
        // User cancelled the sign-in
        debugPrint('Google Sign-In cancelled by user');
        return null;
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication authentication =
          await account.authentication;

      // Get the ID token
      final String? idToken = authentication.idToken;

      if (idToken == null) {
        debugPrint('Google Sign-In: ID token is null');
        return null;
      }

      debugPrint('Google Sign-In successful for: ${account.email}');
      return idToken;
    } catch (e) {
      debugPrint('Google Sign-In error: $e');
      return null;
    }
  }

  /// Sign out from Google
  Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
      debugPrint('Google Sign-Out successful');
    } catch (e) {
      debugPrint('Google Sign-Out error: $e');
    }
  }

  /// Disconnect from Google (revokes access)
  Future<void> disconnect() async {
    try {
      await _googleSignIn.disconnect();
      debugPrint('Google disconnect successful');
    } catch (e) {
      debugPrint('Google disconnect error: $e');
    }
  }

  /// Check if user is currently signed in
  Future<bool> isSignedIn() async {
    return await _googleSignIn.isSignedIn();
  }

  /// Get current Google account (if signed in)
  GoogleSignInAccount? get currentUser => _googleSignIn.currentUser;

  /// Sign in silently (without user interaction)
  /// Useful for auto-login if user previously signed in
  Future<String?> signInSilently() async {
    try {
      final GoogleSignInAccount? account = await _googleSignIn.signInSilently();

      if (account == null) {
        debugPrint('Silent Google Sign-In failed');
        return null;
      }

      final GoogleSignInAuthentication authentication =
          await account.authentication;

      final String? idToken = authentication.idToken;

      if (idToken == null) {
        debugPrint('Silent Google Sign-In: ID token is null');
        return null;
      }

      debugPrint('Silent Google Sign-In successful for: ${account.email}');
      return idToken;
    } catch (e) {
      debugPrint('Silent Google Sign-In error: $e');
      return null;
    }
  }
}
