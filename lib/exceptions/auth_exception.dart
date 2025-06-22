import 'package:syncserve/enums/auth.dart';

/// Custom exception class for authentication errors
class AuthException implements Exception {
  AuthException(this.type);

  final AuthErrorType type;

  @override
  String toString() => 'AuthException: \\${type.toString()}';
}
