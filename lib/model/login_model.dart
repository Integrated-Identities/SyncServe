/// LoginState represents the current state of login process
class LoginState {
  const LoginState({
    this.isLoading = false,
    this.isPasswordVisible = false,
    this.email = '',
    this.password = '',
  });

  final bool isLoading;
  final bool isPasswordVisible;
  final String email;
  final String password;

  LoginState copyWith({
    bool? isLoading,
    bool? isPasswordVisible,
    String? email,
    String? password,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
