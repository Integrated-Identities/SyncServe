import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncserve/services/firebase_auth_service.dart';

part 'auth_state_provider.g.dart';

/// Provider to check if user is authenticated on app startup
@riverpod
Future<bool> isAuthenticated(Ref ref) async {
  final authService = ref.watch(firebaseAuthProvider);

  // Check if user is currently signed in
  final currentUser = authService.currentUser;
  if (currentUser == null) {
    return false;
  }

  // Check if we have valid stored tokens
  final hasValidTokens = await authService.hasValidTokens();
  if (!hasValidTokens) {
    // Try to get fresh token if user is signed in
    final token = await authService.getIdToken();
    return token != null;
  }

  return true;
}

/// Provider to listen to authentication state changes
@riverpod
Stream<bool> authStateChanges(Ref ref) {
  final authService = ref.watch(firebaseAuthProvider);

  return authService.authStateChanges().map((user) => user != null);
}
