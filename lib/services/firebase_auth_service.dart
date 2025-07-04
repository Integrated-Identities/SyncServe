import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncserve/enums/auth.dart';
import 'package:syncserve/services/token_storage_service.dart';
import '../exceptions/auth_exception.dart';

/// Provider for Firebase Authentication service
final firebaseAuthProvider = Provider<FirebaseAuthService>((ref) {
  final tokenStorage = ref.watch(tokenStorageProvider);
  return FirebaseAuthService(tokenStorage);
});

/// Firebase Authentication service
class FirebaseAuthService {
  FirebaseAuthService(this._tokenStorage);

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TokenStorageService _tokenStorage;

  /// Get the current user
  User? get currentUser => _auth.currentUser;

  /// Stream of authentication state changes
  Stream<User?> authStateChanges() => _auth.authStateChanges();

  /// Sign in with email and password
  Future<UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Get and store the ID token after successful sign in
      await _saveUserTokens();

      return userCredential;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          throw AuthException(AuthErrorType.userNotFound);
        case 'wrong-password':
          throw AuthException(AuthErrorType.wrongPassword);
        case 'invalid-credential':
          throw AuthException(AuthErrorType.invalidCredential);
        case 'user-disabled':
          throw AuthException(AuthErrorType.userDisabled);
        default:
          throw AuthException(AuthErrorType.unknown);
      }
    }
  }

  /// Sign out the current user
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      // Clear stored tokens on sign out
      await _tokenStorage.clearTokens();
    } on FirebaseAuthException catch (_) {
      throw AuthException(AuthErrorType.unknown);
    }
  }

  /// Get the current Firebase ID token
  Future<String?> getIdToken({bool forceRefresh = false}) async {
    try {
      final user = _auth.currentUser;
      if (user == null) return null;

      final token = await user.getIdToken(forceRefresh);

      // Save the token to secure storage
      if (token != null) {
        await _tokenStorage.saveToken(token);
      }

      return token;
    } on FirebaseAuthException catch (_) {
      throw AuthException(AuthErrorType.unknown);
    }
  }

  /// Get stored token from secure storage
  Future<String?> getStoredToken() async {
    return await _tokenStorage.getToken();
  }

  /// Refresh and save the current user's tokens
  Future<void> refreshAndSaveTokens() async {
    await _saveUserTokens(forceRefresh: true);
  }

  /// Check if user has valid stored tokens
  Future<bool> hasValidTokens() async {
    return await _tokenStorage.hasTokens();
  }

  /// Get token for API requests (tries stored first, then fresh)
  Future<String?> getTokenForApiRequest() async {
    try {
      // First try to get stored token
      String? token = await _tokenStorage.getToken();

      // If no stored token or user is signed in, get fresh token
      if (token == null && _auth.currentUser != null) {
        token = await getIdToken();
      }

      return token;
    } catch (e) {
      return null;
    }
  }

  /// Validate and refresh token if needed
  Future<String?> getValidToken() async {
    try {
      final user = _auth.currentUser;
      if (user == null) return null;

      // Force refresh to ensure token is valid
      final token = await user.getIdToken(true);
      if (token != null) {
        await _tokenStorage.saveToken(token);
      }

      return token;
    } catch (e) {
      return null;
    }
  }

  /// Private method to save user tokens to secure storage
  Future<void> _saveUserTokens({bool forceRefresh = false}) async {
    try {
      final user = _auth.currentUser;
      if (user == null) return;

      // Get and save ID token
      final idToken = await user.getIdToken(forceRefresh);
      if (idToken != null) {
        await _tokenStorage.saveToken(idToken);
      }

      // Get and save refresh token
      final refreshToken = user.refreshToken;
      if (refreshToken != null) {
        await _tokenStorage.saveRefreshToken(refreshToken);
      }
    } catch (e) {
      throw AuthException(AuthErrorType.unknown);
    }
  }

  /// Send password reset email
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          throw AuthException(AuthErrorType.invalidEmail);
        case 'user-not-found':
          throw AuthException(AuthErrorType.userNotFound);
        default:
          throw AuthException(AuthErrorType.unknown);
      }
    }
  }
}
