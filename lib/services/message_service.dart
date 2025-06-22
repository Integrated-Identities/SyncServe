import 'package:flutter/material.dart';

/// Service for displaying success and error messages using SnackBar.
class MessageService {
  /// Shows an error message in a red SnackBar.
  static void showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.red,
      ),
    );
  }

  /// Shows a success message in a green SnackBar.
  static void showSuccess(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.green,
      ),
    );
  }
}
