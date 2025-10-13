import 'package:google_sign_in/google_sign_in.dart';
import 'package:dio/dio.dart';
import '../../constants/api_constants.dart';
import '../api/api_client.dart';
import '../../result.dart';

/// Google Sign-In Service
/// Handles Google OAuth authentication and backend integration
class GoogleSignInService {
  final GoogleSignIn _googleSignIn;
  final ApiClient _apiClient;

  GoogleSignInService({
    required ApiClient apiClient,
    String? clientId,
  })  : _apiClient = apiClient,
        _googleSignIn = GoogleSignIn(
          clientId: clientId,
          scopes: [
            'email',
            'profile',
            'openid',
          ],
        );

  /// Sign in with Google
  /// Returns user data and auth tokens from backend
  Future<Result<Map<String, dynamic>, String>> signInWithGoogle() async {
    try {
      // Trigger Google Sign-In flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        // User canceled the sign-in
        return Result.failure('Connexion annulée');
      }

      // Get authentication details
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Get tokens
      final String? accessToken = googleAuth.accessToken;
      final String? idToken = googleAuth.idToken;

      if (accessToken == null || idToken == null) {
        return Result.failure('Impossible d\'obtenir les jetons d\'authentification');
      }

      // Send tokens to backend for verification and user creation/login
      final result = await _authenticateWithBackend(
        accessToken: accessToken,
        idToken: idToken,
        email: googleUser.email,
        displayName: googleUser.displayName ?? '',
        photoUrl: googleUser.photoUrl,
      );

      return result;
    } on DioException catch (e) {
      return Result.failure(
        e.response?.data['message'] ?? 'Erreur réseau lors de la connexion Google',
      );
    } catch (e) {
      if (e.toString().contains('SIGN_IN_CANCELED')) {
        return Result.failure('Connexion annulée');
      }
      return Result.failure('Erreur lors de la connexion Google: ${e.toString()}');
    }
  }

  /// Authenticate with backend using Google tokens
  Future<Result<Map<String, dynamic>, String>> _authenticateWithBackend({
    required String accessToken,
    required String idToken,
    required String email,
    required String displayName,
    String? photoUrl,
  }) async {
    try {
      // Send Google tokens to backend for verification
      final response = await _apiClient.post(
        '${ApiConstants.baseUrl}/auth/google',
        data: {
          'accessToken': accessToken,
          'idToken': idToken,
          'email': email,
          'displayName': displayName,
          'photoUrl': photoUrl,
        },
      );

      // Backend should return: { success, token, refreshToken, user }
      if (response.data['success'] == true) {
        return Result.success({
          'token': response.data['token'],
          'refreshToken': response.data['refreshToken'],
          'user': response.data['user'],
        });
      } else {
        return Result.failure(response.data['message'] ?? 'Échec de l\'authentification');
      }
    } on DioException catch (e) {
      return Result.failure(
        e.response?.data['message'] ?? 'Erreur de connexion au serveur',
      );
    } catch (e) {
      return Result.failure('Erreur inattendue: ${e.toString()}');
    }
  }

  /// Sign out from Google
  Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
    } catch (e) {
      // Ignore errors during sign out
    }
  }

  /// Check if user is currently signed in with Google
  Future<bool> isSignedIn() async {
    return await _googleSignIn.isSignedIn();
  }

  /// Get currently signed in Google user
  Future<GoogleSignInAccount?> getCurrentUser() async {
    return _googleSignIn.currentUser;
  }

  /// Silent sign in (if user previously signed in)
  Future<GoogleSignInAccount?> signInSilently() async {
    try {
      return await _googleSignIn.signInSilently();
    } catch (e) {
      return null;
    }
  }

  /// Disconnect Google account (revoke access)
  Future<void> disconnect() async {
    try {
      await _googleSignIn.disconnect();
    } catch (e) {
      // Ignore errors
    }
  }
}
