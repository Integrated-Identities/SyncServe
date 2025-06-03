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

// Elevated Button
  static ButtonStyle elevatedButtonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: Color.fromARGB(255, 237, 125, 125),
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
  }

// EMAIL AND PASSWORD TEXTFORMFIELD
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

// CUSTOMER DETAIL PAGE TEXTFORMFIELD
  static InputDecoration inputDecorationWithLabel(
    String label, {
    bool isRequired = false,
  }) {
    return InputDecoration(
      helperText: ' ',
      alignLabelWithHint: true,
      fillColor: Colors.white,
      filled: true,
      labelText: isRequired ? '$label*' : label,
      labelStyle: const TextStyle(
        color: Colors.black,
        fontSize: 16,
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 22, horizontal: 10),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black),
        borderRadius: BorderRadius.circular(15),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black),
        borderRadius: BorderRadius.circular(15),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
          color: Colors.red,
          width: 2,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(
          color: Colors.red,
          width: 2,
        ),
      ),
    );
  }

  // APP BAR AND NAVIGATION BAR BACKGROUND COLOR
  static const appBarAndNavBarColor = Colors.white;

  // CHECKBOX TEXT STYLE
  static const TextStyle checkBoxTextStyle = TextStyle(
    fontSize: 18,
    color: Colors.black,
  );
}
