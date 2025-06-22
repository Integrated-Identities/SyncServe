/// Enum for authentication error types
/// https://firebase.google.com/docs/auth/admin/errors
enum AuthErrorType {
  invalidEmail,
  invalidCredential,
  requiresRecentLogin,
  unknown,
  userDisabled,
  userNotFound,
  weakPassword,
  wrongPassword,
}
