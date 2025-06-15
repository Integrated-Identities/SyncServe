import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:syncserve/constants/env_variables_keys.dart';
import 'package:syncserve/exceptions/email_exceptions.dart';
import '../constants/app_constants.dart';

/// Provider for the MailerService singleton
final mailerServiceProvider = Provider<MailerService>((ref) {
  return MailerService();
});

/// Service for handling email operations using Gmail SMTP
class MailerService {
  // SMTP server configuration
  static const String _smtpHost = AppConstants.smtpHost;
  static const int _smtpPort = AppConstants.smtpPort;
  bool _isCancelled = false;

  /// Sends an email using Gmail SMTP
  ///
  /// Takes required parameters for email composition and optional attachments
  ///
  /// @param to The recipient email address
  /// @param subject The email subject line
  /// @param body The email body content
  /// @param attachmentPaths Optional list of file paths to attach
  /// @param onLog Optional callback for real-time logging updates
  /// @param l10n Localization object for message strings
  ///
  /// @returns A tuple containing success status and complete log
  Future<(bool success, String log)> sendEmail({
    required String to,
    required String subject,
    required String body,
    required AppLocalizations l10n,
    List<String> attachmentPaths = const [],
    void Function(String)? onLog,
  }) async {
    final StringBuffer log = StringBuffer();
    _isCancelled = false;

    void addLog(String message) {
      log.writeln(message);
      onLog?.call(message);
    }

    try {
      addLog(l10n.emailPreparingToSend(to));

      final String username = dotenv.env[EnvVariablesKeys.emailUsername] ?? '';
      final String password = dotenv.env[EnvVariablesKeys.emailPassword] ?? '';

      if (username.isEmpty || password.isEmpty) {
        throw SmtpConfigException(l10n.emailConfigError);
      }

      if (_isCancelled) {
        throw SendEmailFailure(l10n.emailOperationCancelled);
      }

      addLog(l10n.emailConfiguringSmtp);
      final smtpServer = SmtpServer(
        _smtpHost,
        port: _smtpPort,
        username: username,
        password: password,
        ssl: false,
        allowInsecure: true,
      );

      addLog(l10n.emailCreatingMessage);
      final message = Message()
        ..from = Address(username, AppConstants.appName)
        ..recipients.add(to)
        ..subject = subject
        ..text = body;

      if (attachmentPaths.isNotEmpty) {
        addLog(l10n.emailProcessingAttachments(attachmentPaths.length));
        for (final path in attachmentPaths) {
          if (_isCancelled) {
            throw SendEmailFailure(l10n.emailOperationCancelled);
          }

          addLog(l10n.emailAddingAttachment);
          final file = File(path);
          if (await file.exists()) {
            final size = await file.length();
            addLog(
              l10n.emailAttachmentFileSize((size / 1024).toStringAsFixed(2)),
            );
            message.attachments.add(FileAttachment(file));
          } else {
            throw FileSystemException(l10n.errorFileNotFound);
          }
        }
      }

      if (_isCancelled) {
        throw SendEmailFailure(l10n.emailOperationCancelled);
      }

      addLog(l10n.emailSending);
      await send(message, smtpServer);
      addLog(l10n.emailSentSuccessfully);
      return (true, log.toString());
    } on SmtpConfigException catch (e) {
      addLog(l10n.errorSmtpConfiguration(e.message));
      return (false, log.toString());
    } on SocketException catch (e) {
      addLog(l10n.errorSmtpConnection(e.message));
      return (false, log.toString());
    } on FileSystemException catch (e) {
      addLog(l10n.errorFileSystem(e.message));
      return (false, log.toString());
    } catch (e) {
      addLog(l10n.errorSendingEmail(e.toString()));
      return (false, log.toString());
    }
  }

  /// Cancels any ongoing email sending operation
  void cancel() {
    _isCancelled = true;
  }
}
