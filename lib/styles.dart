import 'package:flutter/material.dart';

///1: TEXT STYLES///

// Welcome back
class AppStyle {
  static const TextStyle headingText = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 30,
    color: Colors.black,
  );

// Hint text for input fields
  static const TextStyle hintText = TextStyle(
    fontSize: 18,
    color: Colors.grey,
  );

// forgotPasswordText
// rename this once it is reused
  static const TextStyle forgotPasswordText = TextStyle(
    decoration: TextDecoration.underline,
    decorationColor: Colors.black,
    color: Colors.black,
  );

// Elevated Button
  static final ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: const Color.fromARGB(255, 237, 125, 125),
    minimumSize: const Size(double.infinity, 60),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    textStyle: const TextStyle(
      fontSize: 20,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    foregroundColor: Colors.white,
  );

//EMAIL AND PASSWORD TEXTFORMFIELD
  static InputDecoration inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      contentPadding: const EdgeInsets.symmetric(vertical: 22, horizontal: 10),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black),
        borderRadius: BorderRadius.circular(15),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
