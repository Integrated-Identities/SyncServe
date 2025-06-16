/// Constants used in the mailer service
class AppConstants {
  const AppConstants._();

  /// SMTP server host for Gmail
  static const String smtpHost = 'smtp.gmail.com';

  /// SMTP server port for Gmail with TLS
  static const int smtpPort = 587;

  /// Application name used in email From field
  static const String appName = 'SyncServe';
}
