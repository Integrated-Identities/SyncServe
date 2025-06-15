/// Exception thrown when email sending fails
class SendEmailFailure implements Exception {
  /// Creates a new [SendEmailFailure] with the given [message]
  const SendEmailFailure(this.message);

  /// The error message
  final String message;

  @override
  String toString() => 'SendEmailFailure: $message';
}

/// Exception thrown when SMTP configuration issues occur
class SmtpConfigException implements Exception {
  /// Creates a new [SmtpConfigException] with the given [message]
  const SmtpConfigException(this.message);

  /// The error message
  final String message;

  @override
  String toString() => 'SmtpConfigException: $message';
}
