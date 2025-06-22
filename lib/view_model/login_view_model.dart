import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:syncserve/exceptions/auth_exception.dart';
import 'package:syncserve/model/login_model.dart';
import 'package:syncserve/services/firebase_auth_service.dart';

part 'login_view_model.g.dart';

/// LoginViewModel manages login business logic
@riverpod
class LoginViewModel extends _$LoginViewModel {
  @override
  LoginState build() => const LoginState();

  /// Toggle password visibility
  void togglePasswordVisibility() {
    state = state.copyWith(isPasswordVisible: !state.isPasswordVisible);
  }

  /// Update email in state
  void updateEmail(String email) {
    state = state.copyWith(email: email);
  }

  /// Update password in state
  void updatePassword(String password) {
    state = state.copyWith(password: password);
  }

  /// Handle login process with email and password
  Future<bool> login() async {
    if (state.isLoading) return false;

    state = state.copyWith(
      isLoading: true,
    );

    try {
      final authService = ref.read(firebaseAuthProvider);
      await authService.signInWithEmailAndPassword(
        email: state.email.trim(),
        password: state.password,
      );
      state = state.copyWith(isLoading: false);
      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
      );
      rethrow;
    }
  }

  /// Handle forgot password process
  Future<bool> sendPasswordResetEmail() async {
    if (state.isLoading) return false;

    state = state.copyWith(
      isLoading: true,
    );

    try {
      final authService = ref.read(firebaseAuthProvider);
      await authService.sendPasswordResetEmail(state.email.trim());
      state = state.copyWith(isLoading: false);
      return true;
    } on AuthException catch (_) {
      state = state.copyWith(
        isLoading: false,
      );
      rethrow;
    }
  }
}
