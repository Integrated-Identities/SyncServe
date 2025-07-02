import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncserve/enums/auth.dart';
import '../exceptions/auth_exception.dart';

/// Provider for Firebase Authentication service
final firebaseAuthProvider = Provider<FirebaseAuthService>((ref) {
  return FirebaseAuthService();
});

/// Firebase Authentication service
class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
    } on FirebaseAuthException catch (_) {
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
